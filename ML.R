# Certification Project
# Set the Directory and load the dataset into R, verify that the data is loaded correctly
getwd()
data<-read.csv("r_scripts/hr.csv",stringsAsFactors = FALSE)
View(data[1:50,])
# Look for missing values
library(Amelia)
missmap(data, main = "Missing values vs observed") # Zero missing values

# For finding the insights
library(Hmisc)
# comput<-data
# comput$salary[comput$salary == "low"] = 0
# comput$salary[comput$salary == "medium"] = 1
# comput$salary[comput$salary == "high"] = 2
# as.factor(comput$department)
# # accounting hr IT management marketing product_mng RandD sales support technical
# comput$department[comput$department == "accounting"] = 0
# comput$department[comput$department == "hr"] = 1
# comput$department[comput$department == "IT"] = 2
# comput$department[comput$department == "management"] = 3
# comput$department[comput$department == "marketing"] = 4
# comput$department[comput$department == "product_mng"] = 5
# comput$department[comput$department == "RandD"] = 6
# comput$department[comput$department == "sales"] = 7
# comput$department[comput$department == "support"] = 8
# comput$department[comput$department == "technical"] = 9 
# comput$salary <- as.factor(comput$salary)
# comput$department<- as.factor(comput$department)
# View(comput)
# str(comput)

co1 <- as.matrix(data[,-c(9,10)])
#rcorr(ccs, type="pearson")
pairs(cor(co1))

left_data<-data[which(data$left == 1),]
co2 <- as.matrix(left_data[,-c(7,9,10)])
pairs(cor(co2))     
library(RColorBrewer)
hist(left_data,breaks=10)
hist(left_data$satisfaction_level,left_data$promotion_last_5years,breaks=10)
plot(left_data$satisfaction_level,left_data$promotion_last_5years)     

dep<-data[,c(7,9)]
as.factor(dep$left)
str(dep)
dep_total<-table(dep)
dep_total_df<-as.data.frame(dep_total)
dep_left<-dep_total_df[which(dep_total_df$left == 1),]
dep_left$percentage<-dep_left$Freq/ sum(dep_left$Freq)
dep_left

# Build a classification model to forecast what are the attributes of people who leave the company

# dataset test/train K-fold
library(caret)

train_ind<- sample(seq_len(nrow(data)),size = 10000)
trainn<-data[train_ind,]
test<-data[-train_ind,]
z<- trainn
z$left <- as.factor(z$left)
str(z)
train_control<- trainControl(method = "cv", number = 100)

# Decision Tree
model_dt<-train(left ~., data =z, trControl=train_control, method = "rpart")
summary(model_dt)
plot(model_dt$finalModel)
text(model_dt$finalModel)
pred_dt<-predict(model_dt,newdata = test)
summary(pred_dt)
table(pred_dt,test$left)
confusionMatrix(table(pred_dt,test$left)) # Accuracy : 90.78%

# Random Forest
model_rf<-train(left ~., data =z, trControl=train_control,method = "rf")
model_rf
summary(model_rf)
pred_rf<-predict(model_rf,newdata = test)
pred_rf
summary(pred_rf)
table(pred_rf,test$left)
confusionMatrix(table(pred_rf,test$left)) # Accuracy : 99.14

# Naive Bayes
model_nb<-train(left ~.,data=z,  method = "nb",  trControl = train_control)
model_nb
summary(model_nb)
pred_nb<-predict(model_nb,newdata = test)
table(pred_nb,test$left)
confusionMatrix(table(pred_nb,test$left)) # Accuracy : 90.96

# SVM svmRadial
model_svm<-train(left ~.,data=z,  method = "svmRadial",  trControl = train_control)
model_svm
summary(model_svm)
pred_svm<-predict(model_svm,newdata = test)
table(pred_svm,test$left)
confusionMatrix(table(pred_svm,test$left)) # Accuracy : 95.1
