# Case study Hyperparameter tuning
# Load data
glass<-read.csv("r_scripts/glass.csv")
glass
glass[,10]<-as.character(glass[,10])
View(glass)
barplot(glass$Type)

# Train-test data set
library(caret)
train_ind<- sample(seq_len(nrow(glass)),size = 150)
trainn<-glass[train_ind,]
test<-glass[-train_ind,]
z<- trainn
str(z)
View(z)

z_test<-test[,-c(10)]
z_eval<-test[,c(10)]
library(rpart)
library(dplyr)
model<-rpart(Type ~.,data = z)
model
summary(model)
plot(model,margin = 0.1)
text(model,use.n = TRUE,pretty = TRUE,cex=0.8)
pred<-predict(model,newdata = z_test, type = "class")
summary(pred)
View(pred)
z_eval<-as.integer(z_eval)
table(pred,z_eval)
confusionMatrix(table(pred,z_eval)) #Accuracy is 67.19%
# Task 3 - Make a k-fold split with 3 splits and measure the accuracy score with each split

# training control
train_control<- trainControl(method = "cv", number = 3)
model1<-train(Type ~., data =z, trControl=train_control, method = "rpart")
summary(model1)
pred1<-predict(model1,newdata = test)
summary(pred1)
table(pred1,test$Type)
confusionMatrix(table(pred1,test$Type)) # 57.8%1


# Task 4 - Findout a suitable number of estimators for a RandomForestClassifer along with a 10-fold cross validation.
train_control1<- trainControl(method = "cv", number = 10)
model2<-train(Type ~., data =z, trControl=train_control1, ntree=8 ,method = "rf")
model2
summary(model2)
pred2<-predict(model2,newdata = test)
summary(pred2)
table(pred2,test$Type)
confusionMatrix(table(pred2,test$Type)) 
# ntree = 12, Accuracy = 67.19
# ntree = 10, Accuracy = 67.19
# ntree = 8, Accuracy = 68.75
# ntree = 5, Accuracy = 65.62
