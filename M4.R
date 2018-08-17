# Assignment 4
# data loading
getwd()
video_games <- read.csv("r_scripts/video_game.csv",na.strings=c("","NA")) 
View(video_games)

str(video_games)

video_games<-
  subset(video_games, select = -c(1,2,4))

library(Amelia)
missmap(video_games, main = "Missing values vs observed")

video_games <- video_games[!is.na(video_games$Rating),]

video_games <- video_games[!is.na(video_games$User_Count),]

video_games <- video_games[!is.na(video_games$Critic_Count),]
rownames(video_games) <- NULL

missmap(video_games, main = "Missing values vs observed")

# Task 1
# creating test set and training set
# divide the dataset for training and testing
set.seed(2)
library(caTools)
split <- sample.split(video_games$Other_players, SplitRatio = 0.7)
# we devide the data in 0.7 ratio

training_data<-subset(video_games, split=="TRUE")
testing_data<-subset(video_games, split=="FALSE")

View(training_data)

model<-lm(Other_players~.,data = training_data)

#model<-lm(Other_players~ Name + Platform + NA_players + EU_players + JP_players + Global_players,data = training_data,na.action = na.omit)

summary(model)

# now we can use our model to predict test data
predict<-predict(model,testing_data)


# Logistic regression
# data loading
getwd()
emp_data <- read.csv("r_scripts/Employee_Data.csv",na.strings=c("?")) 
View(emp_data)

str(emp_data)

# Remove null containing rows in data set
emp_data <- emp_data[!is.na(emp_data$Occ_Of_Emp),]
rownames(emp_data) <- NULL
emp_data <- emp_data[!is.na(emp_data$country_of_res),]
rownames(emp_data) <- NULL

library(Amelia)
missmap(emp_data, main = "Missing values vs observed")

# Remove id
emp_data <- subset(emp_data, select = -c(3))

set.seed(2)
library(caTools)
split1 <- sample.split(emp_data$Emp_Sal, SplitRatio = 0.7)

training_data<-subset(emp_data, split1=="TRUE")
testing_data<-subset(emp_data, split1=="FALSE")

sapply(training_data,function(x) sum(is.na(x)))
sapply(training_data, function(x) length(unique(x)))

missmap(training_data, main = "Missing values vs observed")

model2<-glm(Emp_Sal ~., data = training_data, family = "binomial") # generalized linear model
summary(model2)

# Prediction
predi <- predict(model2,newdata = testing_data, type = "response")
predi

# Confusion matrix
nrow(testing_data)
length(predi)
table(Actualvalues = testing_data$Emp_Sal, predictedvalues = predi> 0.5)

# ROC curve (Receiver Operating Characteristic)
library(ROCR)
ROCpred<-prediction(predi,testing_data$Emp_Sal)
ROCpref<-performance(ROCpred,"tpr","fpr")


plot(ROCpref,cpl = "blue",print.cutoffs.at = seq(0.1,by=0.1), text.adj = c(-0.5,1.7),cex=0.9)
