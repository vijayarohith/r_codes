getwd()
hospital <- read.csv("r_scripts/data.csv")
View(hospital)
str(hospital)
library(psych)

is.na(hospital)
library(Amelia)
missmap(hospital, main = "Missing values vs observed")
hospital1<- subset(hospital,select = c(-1,-2,-33))
View(hospital1)
missmap(hospital1, main = "Missing values vs observed")

pc<-principal(cov(hospital1), nfactors = 5, rotate = "none")
pc
# 
# library(FactoMineR)
# result <- PCA(hospital1)
# 
# pca=princomp(hospital1, cor=TRUE)
# summary(pca)
# 
# pca$scores
# biplot(pca)
