# Linear regression(linear model)

# load data
library(MASS)
data("Boston")
View(Boston)

# data description 
?Boston


# to view correlation of variables
plot(Boston$crim,Boston$medv,cex=0.5, xlab = "Crime", ylab = "Price")
cr <- cor(Boston)

# use corrplot to visualize
library(corrplot)

corrplot(cr,type = "lower")


# split the data set into 2, one for training and another for testing

set.seed(2)
library(caTools)

split <- sample.split(Boston$medv, SplitRatio = 0.7)
# we devide the data in 0.7 ratio
split

training_data<-subset(Boston, split=="TRUE")
testing_data<-subset(Boston, split=="FALSE")


# linear regression model[ lm - linear model]
colnames(training_data)

# to create the model we use all columns(uses odinary least square OLS)

model<-lm(medv~.,data = training_data)

# or
model <- lm(medv~ crim + zn + indus + chas + nox + rm + age + dis + rad + tax + ptratio + black + lstat, data = training_data)

# discription of model

summary(model)

# now we can use our model to predict test data
predict<-predict(model,testing_data)

# ploting predicted data against test data
# plot test data
plot(testing_data$medv,type = "l",lty=1.8,col="green")
# plot predicted data
lines(predict,type = "l",col = "blue")

# diagnostics
library(car)
outlierTest(model)
qqPlot(model,main = "QQ Plot")
leveragePlots(model)

#-----------------------------------------------------------------------

# Logistic regression(logistic model)

getwd()
diabet <- read.csv("r_scripts/Diabetes.csv") 
View(diabet)

# divide the dataset for training and testing
set.seed(2)

library(caTools)

split <- sample.split(diabet$Is_Diabetic, SplitRatio = 0.7)
# we devide the data in 0.7 ratio

training_data<-subset(diabet, split=="TRUE")
testing_data<-subset(diabet, split=="FALSE")

# Logistic Regression
colnames(diabet)
# Maximum likelihood estimation (MLE)
model2<-glm(Is_Diabetic ~., data = training_data, family = "binomial") # generalized linear model
summary(model2)

# prediction
predi <- predict(model2,newdata = testing_data, type = "response")
predi

# Confusion matrix
nrow(testing_data)
length(predi)
table(Actualvalues = testing_data$Is_Diabetic, predictedvalues = predi> 0.3)
table(Actualvalues = testing_data$Is_Diabetic, predictedvalues = predi> 0.7)

# ROC curve (Receiver Operating Characteristic)
library(ROCR)
ROCpred<-prediction(predi,testing_data$Is_Diabetic)
ROCpref<-performance(ROCpred,"tpr","fpr")

plot(ROCpref,cpl = "blue",print.cutoffs.at = seq(0.1,by=0.1), text.adj = c(-0.5,1.7),cex=0.9)



