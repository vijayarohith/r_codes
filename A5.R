## Question 1
library(ggplot2)
House=read.csv("housingdata.csv")

## Question 2
str(House)

## Question 3
plot(House$Income~House$Credit_Record)
plot(House$Income~factor(House$Credit_Record))

## Question 4
ggplot(House,aes(x=Income,y=PropertyValue,col=No_kids,cex=No_kids))+geom_point()+geom_smooth()

## Question 5
plot(House$PropertyValue~House$Income,col=House$No_kids)
plot(House$PropertyValue~House$Income,col=factor(House$No_kids))
ggplot(House,aes(x=Income,y=PropertyValue,col=factor(No_kids)))+geom_point()

## Question 6
ggplot(House,aes(x=Income,y=PropertyValue))+geom_point()
ggplot(House,aes(y=Income,x=PropertyValue))+geom_point()
ggplot(House,aes(x=Income,y=PropertyValue,col=factor(No_kids)))+geom_point()
ggplot(House,aes(x=Income,y=PropertyValue,col=factor(No_kids)))+geom_point(cex=1,pch=6)

## Question 7
ggplot(House,aes(x=Income,y=PropertyValue))+geom_point()
ggplot(House,aes(x=Income,y=PropertyValue))+geom_jitter()
ggplot(House,aes(x=Income,y=PropertyValue))+geom_jitter(width = 0.1)

## Question 8
ggplot(House,aes(x=Income))+geom_histogram()
ggplot(House,aes(x=Income))+geom_histogram(binwidth = 100)
ggplot(House,aes(x=Income),aes(y=density(Income)))+geom_histogram()+geom_density()
ggplot(House,aes(x=Income),aes(y=density(Income)))+geom_density()
ggplot(House,aes(x=Income,fill="#377EB8"))+geom_density(aes(y=..density..))

## Question 9
ggplot(House,aes(x=Property_Purchased,fill=Education))+geom_bar()
ggplot(House,aes(x=Property_Purchased,fill=Education))+geom_bar(position = "stack")
ggplot(House,aes(x=Property_Purchased,fill=Education))+geom_bar(position = "fill")
ggplot(House,aes(x=Property_Purchased,fill=Education))+geom_bar(position = "dodge")

## Question 10
ggplot(House,aes(x=Property_Purchased,fill=Education))+geom_bar(posn_d<-position_dodge(0.7))

## Question 11
ggplot(House,aes(x=Income,col=Income,fill=HasCar))+geom_histogram(binwidth = 10000)
ggplot(House,aes(x=Income,col=Income,fill=HasCar))+geom_histogram(binwidth = 10000, position = "identity")

## Question 12
ggplot(House,aes(x=Income,y=PropertyValue))+geom_point()
ggplot(House,aes(x=Income,y=PropertyValue))+geom_point()+facet_grid(.~HasCar)
ggplot(House,aes(x=Income,y=PropertyValue))+geom_point()+facet_grid(.~No_kids)
ggplot(House,aes(x=Income,y=PropertyValue))+geom_point()+facet_grid(HasCar~No_kids)

