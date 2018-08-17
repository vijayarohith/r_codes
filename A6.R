## Question 1
library(NLP)
library(tm)
library(SnowballC)
tweets<-read.csv("/home/rohy/r_scripts/tweets.csv",stringsAsFactors = F)

## Question 2
str(tweets)

## Question 3
r1 = as.character(tweets$Tweet)
set.seed(100)
sample = sample(r1, (length(r1)))

## Questions 4
tweets_v1<-tweets$Tweet
tweets_for_mining <- VectorSource(tweets_v1)
tweets_corpus<- VCorpus(tweets_for_mining)
processed_tweets_punc<-tm_map(tweets_corpus, removePunctuation)
processed_tweets_punc_lower<-tm_map(processed_tweets_punc, content_transformer(tolower))
processed_tweets_punc_lower_num<-tm_map(processed_tweets_punc_lower, removeNumbers)
processed_tweets_punc_lower_num_space<-tm_map(processed_tweets_punc_lower_num, stripWhitespace)
processed_tweets_punc_lower_num_space_stopwords<-tm_map(processed_tweets_punc_lower_num_space, removeWords, stopwords('english'))
tweets_corpus_dtm<-DocumentTermMatrix(tweets_corpus)
data_twitter <- data.frame(as.matrix(tweets_corpus_dtm), stringsAsFactors=FALSE)
View(data_twitter)

inspect(processed_tweets_punc_lower_num_space_stopwords)

## Question 5
library(wordcloud2)

tweets_corpus_tdm<-TermDocumentMatrix(processed_tweets_punc_lower_num_space_stopwords)
mat<-as.matrix(tweets_corpus_tdm)
mat_v <- sort(rowSums(mat),decreasing=TRUE)
data_twitter_for_wc <- data.frame(word =names(mat_v),freq=mat_v)
head(data_twitter_for_wc)

library(wordcloud)
library(RColorBrewer)
set.seed(1234)
wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq,
          random.order=T, colors=brewer.pal(8, "Dark2"))

wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq,
          random.order=F, colors=brewer.pal(8, "Dark2"))
wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq, min.freq = 5,random.order=F, colors=brewer.pal(8, "Dark2"))

## Text Mining and Visualization for negative Tweets
## Question 1
library(dplyr)
negativeTweets<-filter(tweets, Avg < 0)
n1 = as.character(negativeTweets$Tweet)
set.seed(100)
sample2 = sample(n1, (length(n1)))

tweets_v1<-negativeTweets$Tweet
tweets_for_mining <- VectorSource(tweets_v1)
tweets_corpus<- VCorpus(tweets_for_mining)
processed_tweets_punc<-tm_map(tweets_corpus, removePunctuation)
processed_tweets_punc_lower<-tm_map(processed_tweets_punc, content_transformer(tolower))
processed_tweets_punc_lower_num<-tm_map(processed_tweets_punc_lower, removeNumbers)
processed_tweets_punc_lower_num_space<-tm_map(processed_tweets_punc_lower_num, stripWhitespace)
processed_tweets_punc_lower_num_space_stopwords<-tm_map(processed_tweets_punc_lower_num_space, removeWords, stopwords('english'))
tweets_corpus_dtm<-DocumentTermMatrix(tweets_corpus)
data_twitter <- data.frame(as.matrix(tweets_corpus_dtm), stringsAsFactors=FALSE)
View(data_twitter)

inspect(processed_tweets_punc_lower_num_space_stopwords)

## Question 5
library(wordcloud2)

tweets_corpus_tdm<-TermDocumentMatrix(processed_tweets_punc_lower_num_space_stopwords)
mat<-as.matrix(tweets_corpus_tdm)
mat_v <- sort(rowSums(mat),decreasing=TRUE)
data_twitter_for_wc <- data.frame(word =names(mat_v),freq=mat_v)
head(data_twitter_for_wc)

library(wordcloud)
library(RColorBrewer)
set.seed(1234)
wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq,
          random.order=T, colors=brewer.pal(8, "Dark2"))

wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq,
          random.order=F, colors=brewer.pal(8, "Dark2"))
wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq, min.freq = 5,random.order=F, colors=brewer.pal(8, "Dark2"))

## Text Mining and Visualization for Positive Tweets

library(dplyr)
PositiveTweets<-filter(tweets, Avg > 0)
n1 = as.character(PositiveTweets$Tweet)
set.seed(100)
sample2 = sample(n1, (length(n1)))

tweets_v1<-PositiveTweets$Tweet
tweets_for_mining <- VectorSource(tweets_v1)
tweets_corpus<- VCorpus(tweets_for_mining)
processed_tweets_punc<-tm_map(tweets_corpus, removePunctuation)
processed_tweets_punc_lower<-tm_map(processed_tweets_punc, content_transformer(tolower))
processed_tweets_punc_lower_num<-tm_map(processed_tweets_punc_lower, removeNumbers)
processed_tweets_punc_lower_num_space<-tm_map(processed_tweets_punc_lower_num, stripWhitespace)
processed_tweets_punc_lower_num_space_stopwords<-tm_map(processed_tweets_punc_lower_num_space, removeWords, stopwords('english'))
tweets_corpus_dtm<-DocumentTermMatrix(tweets_corpus)
data_twitter <- data.frame(as.matrix(tweets_corpus_dtm), stringsAsFactors=FALSE)
View(data_twitter)

inspect(processed_tweets_punc_lower_num_space_stopwords)

## Question 5
library(wordcloud2)

tweets_corpus_tdm<-TermDocumentMatrix(processed_tweets_punc_lower_num_space_stopwords)
mat<-as.matrix(tweets_corpus_tdm)
mat_v <- sort(rowSums(mat),decreasing=TRUE)
data_twitter_for_wc <- data.frame(word =names(mat_v),freq=mat_v)
head(data_twitter_for_wc)

library(wordcloud)
library(RColorBrewer)
set.seed(1234)
wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq,
          random.order=T, colors=brewer.pal(8, "Dark2"))

wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq,
          random.order=F, colors=brewer.pal(8, "Dark2"))
wordcloud(words = data_twitter_for_wc$word, freq = data_twitter_for_wc$freq, min.freq = 5,random.order=F, colors=brewer.pal(8, "Dark2"))

