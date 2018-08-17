# Assignment 8 - Text mining
# Task 1
# required packages for text mining
library(tm)
library(dplyr)
library(SnowballC)

# read tab seperated data

dataRR<- read.delim2("r_scripts/textmining/RestReviews.tsv",sep = "\t",quote = "")
View(dataRR)
class(dataRR)

# chage DF to match datframesource formate of corpus function

df1<- data.frame(doc_id=row.names(dataRR),
                     text=dataRR$Review)
df11 <- data.frame(doc_id=row.names(dataRR),
                   text=dataRR$Review, review=dataRR$Liked)
View(df1)
# Create corpus using the data

corpusRR <- Corpus(DataframeSource(df1)) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("english")) %>%
  tm_map(stripWhitespace) %>%
  tm_map(stemDocument)

# Document term matrix
dtmRR<- DocumentTermMatrix(corpusRR)
dtmRR
View(dtmRR[1:1000,])
View(dtmRR)

## Task 2

# DTM to dataset conversion
df2<-as.data.frame(as.matrix(dtmRR))
str(df2)
View(df2[1:5,"review"])
View(df11[1:5,"review"])

# # Datasets merged 

df2<-merge(x=df2,y=df11,by.x = "row.names", by.y = "row.names")
View(df2[1:5,])
View(df2[,1])

df2$review.y[df2$review.y == 0] = "NO"
df2$review.y[df2$review.y == 1] = "YES"
df2$review.y <- as.factor(df2$review.y)

# Classifier
library(e1071)
Naive_Bayes_Model=naiveBayes(review.y ~., data=df2)
Naive_Bayes_Model
View(df2[1,])

colnames(df2)

# df2<-df2[-c(1,1577,1578)]

NB_Predictions=predict(Naive_Bayes_Model,df2)
#Confusion matrix to check accuracy
table(NB_Predictions , df2$review.y)

