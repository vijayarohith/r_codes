# Recommender Engine
# for this expample we create a small artificial data set as a matrix
library(recommenderlab)

m<- matrix(sample(c(as.numeric(0:5),NA),50, replace = TRUE, prob=c(rep(.4/6,6),.6)),ncol = 10,
           dimnames = list(user=paste("u",1:5,sep = ''), item = paste("i",1:10, sep='')))
m

r <- as(m,"realRatingMatrix")
r

getRatingMatrix(r)

class(r)

identical(as(r,"matrix"),m)

as(r,"list")

de<-as(r,"data.frame")

head(de)

r_m <- normalize(r)
r_m
getRatingMatrix(r_m)

getRatingMatrix(denormalize(r_m))

image(r, main = "Raw Ratings")
image(r_m, main = "Normalized Ratings")



##

data("Jester5k")
Jester5k
getRatingMatrix(Jester5k)

set.seed(1234)
r <- sample(Jester5k,1000)
r

rowCounts(r[1,])
as(r[1,],"list")
rowMeans(r[1,])


hist(getRatings(r), breaks=100)
hist(getRatings(normalize(r)),breaks =100)
hist(getRatings(normalize(r, method = "z-score")),breaks =100)   
hist(rowCounts(r),breaks =50)     
hist(colMeans(r), breaks=20)     

recommenderRegistry$get_entries(dataType = "realRatingMatrix")

r<-Recommender(Jester5k[1:1000],method = "POPULAR")
r

names(getModel(r))

getModel(r)$topN

recom <- predict(r, Jester5k[1001:1002], n=5)
recom

as(recom, "list")



e<- evaluationScheme(Jester5k[1:1000], method = "split",train = 0.9, given=15,goodRating =1)
e

r1<- Recommender(getData(e,"train"),"UBCF")
r1

r2<- Recommender(getData(e,"train"),"IBCF")
r2

p1<-predict(r1,getData(e,"known"), type = "ratings")
p1

p2<-predict(r2,getData(e,"known"), type = "ratings")
getRatingMatrix(p2[1:10,1:10])


as(p1,"list")

error<-rbind(
  UBCF = calcPredictionAccuracy(p1,getData(e,"unknown")),
  IBCF = calcPredictionAccuracy(p2,getData(e,"unknown"))
)

error

