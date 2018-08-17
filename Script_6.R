# use \ before " or ' which comes as part of the string
v<- "Welcome to R"
v1<- "Welcome to \"R\""
v1

# integer manipulation
x<- 7.42342424
x
format(x,digits = 1,scientific = T)
format(x,digits = 2,scientific = T)
format(x,digits = 5,scientific = T)
# formatc function
formatC(x,format = "f",digits = 1)
formatC(x,format = "e",digits = 1)
formatC(x,format = "g",digits = 1)

## paste function
distance_covered<- c(55,54,43,54)
day_of_week<- c("mon","tue","wed","thu")
expense_raised<- c(45,35,55,43)

distance_covered1<- paste(distance_covered,"km",sep="") 
distance_covered1
day_of_week1<- paste(day_of_week,":",sep="") 
day_of_week1
expense_raised1<- paste("$",expense_raised,sep="")
expense_raised1
Final_Vector<- paste(day_of_week1,distance_covered1,expense_raised1,sep="-")
Final_Vector
Final_Vector<- paste(day_of_week1,distance_covered1,expense_raised1,sep="-",collapse = ";")
Final_Vector

# stringr package
library(stringr)
v1<- c(NA,"India",NA,"America")
v2<- c("Washington DC","Chennai","London","California")
paste(v1,v2)
str_c(v1,v2)
str_c(v1,"-",v2)

# extract text string
str_sub(v2,1,3)
str_sub(v2,-3,-1)

# pattern in text string
str_detect(v2,pattern = fixed("na"))
str_count(v2,pattern = fixed("na"))

# string split
v3<- c("Violin;Guitar","samba;salsa;Ballet;Tango")
str_split(v3,pattern = ";")
str_split(v3,pattern = ";",simplify = T)

# String replace
str_replace(v3,pattern = ";",replacement = "&")
str_replace_all(v3,pattern = ";",replacement = "&")

# Text Mining 
library(NLP)
library(tm)

tweets_v<-read.csv("/home/rohy/r_scripts/tweets.csv",stringsAsFactors = F)
tweets_v
str(tweets_v)
nrow(tweets_v)
class(tweets_v)

# seperating out field that requires text mining
tweets_v1<-tweets_v$Tweet
tweets_v1
tweets_v1[1]

# vector source will take vector as argument
tweets_for_mining <- VectorSource(tweets_v1)
tweets_for_mining
tweets_for_mining[1] 

tweets_corpus<- VCorpus(tweets_for_mining)
print(tweets_corpus)

# Cleaning functions with TM package

v<-tm_map(tweets_corpus, tolower)
v[[1]][1]
v1<-tm_map(v,removePunctuation)
v1[[1]][1]

# Stemming
library(SnowballC)

v2<- c("addition","additive","additional")
v2
stem_doc <- stemDocument(v2)
v3<-"addition"
v3
complete_text<-stemCompletion(stem_doc,v3)
complete_text

# Document term matrix
v4<-DocumentTermMatrix(tweets_corpus)
v4

v5<-as.matrix(v4)
# checking the dimension of matrix
dim(v5)
v5
# review a portion of matrix. In rows we have documents and in col we have terms or words
v5[13:4, 9:5]

# Term Document Matrix
v6<-TermDocumentMatrix(tweets_corpus)
v6

v7<-as.matrix(v6)
# checking the dimension of matrix
dim(v7)
v7
# review a portion of matrix. In rows we have documents and in col we have terms or words
v7[, 9:5]




