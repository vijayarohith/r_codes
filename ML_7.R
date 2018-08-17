# Assignment Recommendations
## Task 1
library(arules)
data("Adult")

adultdata <- as(Adult, "transactions")
summary(adultdata)
adultdata
inspect(adultdata)
inspect(adultdata[,1])
itemFrequency(adultdata[,1])
itemFrequency(adultdata[,1:10])
itemFrequencyPlot(adultdata,support = 0.8)
# Plot top 10 support
itemFrequencyPlot(adultdata,topN = 10)

rules <- apriori(adultdata)

rules
summary(rules)

rules <- apriori(adultdata, appearance = list(default = "rhs", lhs=c("capital-loss=None" , "native-country=United-States")))
rules
summary(rules)
inspect(rules[1:8])

library(arulesViz)

plot(rules)

## Task 2
library(recommenderlab)

movie<- read.csv("r_scripts/movie.csv", header = T, row.names = 1)
View(movie[,1:10])

m<-as(movie,"matrix")
str(m)

View(m[1:10,1:10])

rrm<-as(m,"realRatingMatrix")
getRatingMatrix(rrm)
class(rrm)
rn<-normalize(rrm)
getRatingMatrix(rn)
hist(getRatings(rn), breaks=100)

recommenderRegistry$get_entries(dataType = "realRatingMatrix")

scheme <- evaluationScheme(rrm, method = "split", train = .9,
                           k = 1, given = 10, goodRating = 4)

scheme

algorithms <- list(
  "user-based CF" = list(name="UBCF", param=list(normalize = "Z-score",
                                                 method="Cosine",
                                                 nn=50, minRating=3))
  
)

results <- evaluate(scheme, algorithms, n=c(1, 3, 5, 10, 15, 20))


resultt<-Recommender(getData(scheme,"train"),"UBCF")
resultt

names(getModel(resultt))

recom1 <- predict(resultt,rrm[101],type="ratings")
recom1

recom2 <- predict(resultt,rrm[102],type="ratings")
recom2


str(recom)

getRatingMatrix(recom)

data1<-as(recom1,"data.frame")
data2<-as(recom2,"data.frame")

library(dplyr)

# movie suggession for 2 users requested
head(arrange(data1, desc(rating)))[-3]
head(arrange(data2, desc(rating)))[-3]


# library(tseries)
# movie<- read.matrix("r_scripts/movie.csv",sep = "", skip = 0)
# summary(movie)
#rrm<-as(as(movie,"matrix"),"realRatingMatrix")
# 
# View(mmr[1:10,1:10])
# identical(mmp,mmr)
# rrmp<-as(mmp,"realRatingMatrix")
# rrmp[1][1]
# View(getRatingMatrix(rrmp[1:10,1:10]))
# rrmr<-as(mmr,"realRatingMatrix")
# rrmr
# identical(rrmr,rrmp)
# identical(as(rrmr,"matrix"),as(rrmp,"matrix"))
# identical(as(rrmp,"matrix"),as(movie,"matrix"))
# identical(as(rrmr,"matrix"),mmr)
# 
# as(r,"list")
# mm1<-as(rrm,"matrix")
# getRatingMatrix(rrm)
# identical(mm,mm1)
# 
# as(rrmp,"data.frame")








          