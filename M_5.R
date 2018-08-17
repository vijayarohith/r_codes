# Assignment Classification
library(AER)
View(AER)

View(Affairs)
library(dplyr)

newdata<- mutate(Affairs,status = affairs)
View(newdata)

# Task 1
# replace values more than 0 as 1
newdata$status[newdata$status > 0] = "YES"
newdata$status[newdata$status == 0] = "NO"
str(newdata)

newdata<- subset(newdata,select=-c(1))

# Change char to factor
newdata$status<- as.factor(newdata$status)
str(newdata)

# Task 2
library(rpart)

set.seed(2)
id<-sample(2,nrow(newdata),prob = c(0.7,0.3), replace = TRUE)
train_d<-newdata[id==1,]
test_d<-newdata[id==2,]

affair_model<-rpart(status ~.,data = train_d)

affair_model

plot(affair_model,margin = 0.1)
text(affair_model,use.n = TRUE,pretty = TRUE,cex=0.8)

pred_d<-predict(affair_model,newdata = test_d,type = "class")
pred_d


nrow(test_d)
length(pred_d)
table(Actualvalues = test_d$status, predictedvalues = pred_d)
library(caret)
library(e1071)
confusionMatrix(table(Actualvalues = test_d$status, predictedvalues = pred_d))

# Task 3
# Random forest
library(randomForest)
affair_random<-randomForest(status ~.,data = train_d)
affair_random



pred_d1<-predict(affair_random,newdata = test_d,type = "class")
pred_d1

confusionMatrix(table(Actualvalues = test_d$status, predictedvalues = pred_d1))

importance(affair_random)