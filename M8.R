# required packages for text mining
library(tm)
library(dplyr)
library(SnowballC)

# loadning data

# HP 6 book - The Half blood Prince
bookHP6 <- readLines("r_scripts/textmining/HP6 - The Half Blood Prince.txt")

# HP 7 book - Deathly Hollows
bookHP7 <- readLines("r_scripts/textmining/HP7 - Deathly Hollows.txt",encoding  ="UTF-8")

bookDF<- as.data.frame(bookHP6)
View(bookDF)

bookDF1<- data.frame(doc_id=row.names(bookDF),
                       text=bookDF$bookHP6)

View(bookDF1)
# Corpus for HP6

# setting system local so the input file can be processed without error

Sys.setlocale("LC_ALL", "C")

corpusHP6 <- Corpus(DataframeSource(bookDF1)) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("english")) %>%
  tm_map(stripWhitespace) %>%
  tm_map(stemDocument)
  

# create term document matrices & remove sparse terms
dtmHP6<- DocumentTermMatrix(corpusHP6)
dtmHP6
View(dtmHP6)
dim(dtmHP6)
inspect(dtmHP6[1:10,])

# Rmoving sparse term
dtmHP6<- removeSparseTerms(dtmHP6,0.98)
dtmHP6

# Calculate word frequence

word.freqHP6<- sort(colSums(as.matrix(dtmHP6)),decreasing = T)

# creating frequence table
tableHP6 <- data.frame(word =  names(word.freqHP6),
                       absolute.frequence = word.freqHP6,
                       relative.frequence = word.freqHP6/length(word.freqHP6))

# remove the word from row name

rownames(tableHP6) <- NULL

head(tableHP6)


# export the data

write.csv(tableHP6,"r_scripts/textmining/tableHP6.csv")




## Sentiment Analysis
library(twitteR)
library(RCurl)
library(tm)
library(wordcloud)
library(stringr)
library(plyr)
library(dplyr)

# inomplete coz twitter document is missing in edureka site and twitter developer account needs permission from twitter which takes time to get after applying

