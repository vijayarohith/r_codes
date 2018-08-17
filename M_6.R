# assignment unsupervised
# Task 1, Load XLSX library and file to R
getwd()
library(xlsx)
ins<-read.xlsx("r_scripts/InsuranceData.xlsx",1)
View(ins)

# Task 2 , Perform K-Means clustering on data

distant<- dist(as.matrix(ins))
distant

## within sum of square
my_data<-ins
wss <- (nrow(my_data)-1)*sum(apply(my_data,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(my_data,centers = i)$withinss)
plot(1:15,wss,type = "b", xlab = "Number of Clusters", ylab = "Within groups sum of square",las=1)  

k_means<-kmeans(my_data,3)
summary(k_means)
k_means

k_means$cluster

my_data$cluster <- NA

my_data$cluster<-k_means$cluster

plot(my_data$Age,my_data$Income, col = ifelse(my_data$cluster == 1,"red",ifelse(my_data$cluster == 2,"green","black")))

# C_Means clustering

my_data2<-ins
distant<- dist(as.matrix(ins))
distant
library(e1071)
c_means<- cmeans(distant,3)
c_means
c_means$membership

write.csv(c_means$membership,"r_scripts/membership.csv")
