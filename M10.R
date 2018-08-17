set.seed(123)
data(mtcars)
cars<-mtcars
train_ind<- sample(seq_len(nrow(cars)),size = 20)
train<-cars[train_ind,]
test<-cars[-train_ind,]

z<-train[,c(3,5,7)]
z_test<-test[,c(3,5)]
z_eval<-test[,c[7]]

model<-train()


View(mtcars)
