setwd("/home/rohy/r_scripts/")
getwd()
House=read.csv("housingdata1.csv")
View(House)

hist(House$price)
hist(House$price,xlab="Price of house",ylab = "Number of houses")
hist(House$price,col="Green",xlab="Price of house",ylab = "Number of houses")

# Functions for series of colors
colorRampPalette(c("blue","green","red")) -> colfun
hist(House$price,col=colfun(10))
hist(House$price,col="Green",xlab="Price of house",ylab = "Number of houses",main = "Price distribution of house")
hist(House$price,col=colfun(10),breaks = 7)

# Scatter plot functanality
plot(House$price~House$living_area)

# pch is 0 to 25 (shape of the plot)
plot(House$price~House$living_area,pch=1,col="red")

# boxplot
boxplot(House$price)
boxplot(House$price~House$waterfront,col=c("red","blue"))

View(iris)
plot(iris$Petal.Length,iris$Sepal.Length,col=iris$Species)

# pie chart
unique(House$air_cond)

table(House$air_cond)

pie(table(House$air_cond))

# ggplot2
library(ggplot2)

ggplot(iris,aes(x=Petal.Length,y=Sepal.Length))+geom_point()
ggplot(iris,aes(x=Petal.Length,y=Sepal.Length,col=Species))+geom_point()
ggplot(iris,aes(x=Petal.Length,y=Sepal.Length,shape=Species))+geom_point()

ggplot(House,aes(x=price,fill=air_cond))+geom_histogram(fill="red",col = "blue")
ggplot(House,aes(x=price,fill=air_cond))+geom_histogram(col = "blue")
ggplot(House,aes(x=price,fill=air_cond))+geom_histogram(position = "identity")
ggplot(House,aes(x=price,fill=air_cond))+geom_histogram(position = "fill")

ggplot(House,aes(x=waterfront))+geom_bar(fill="blue")
ggplot(House,aes(x=price,y=living_area))+geom_point(col="red")
ggplot(House,aes(x=price,y=living_area,col=rooms))+geom_point()

# Density Plot
ggplot(House,aes(x=price))+geom_density()
ggplot(House,aes(x=price))+geom_density(fill="orange")
ggplot(House,aes(x=price,fill=air_cond))+geom_density()

# Transperence level. alpha
ggplot(House,aes(x=price,fill=air_cond))+geom_density(alpha=0.75)
# Smooth Curve
ggplot(House,aes(x=price,y=living_area))+geom_smooth()
# Split by water Front Variable
ggplot(House,aes(x=price,y=living_area,col=waterfront))+geom_smooth()
ggplot(House,aes(x=price,y=living_area,col=waterfront))+geom_smooth(se=F)
ggplot(House,aes(x=price,y=living_area,col=heat))+geom_smooth(se=F)+geom_point()

# Boxplot
ggplot(House,aes(y=price,x=factor(rooms)))+geom_boxplot()

str(House)
ggplot(House,aes(x=rooms,y=price,col=rooms))+geom_boxplot()

# Violin plot
ggplot(House,aes(x=waterfront,y=price))+geom_violin()
ggplot(House,aes(x=waterfront,y=price,fill=air_cond))+geom_violin()

# Faceting 
ggplot(House,aes(x=living_area,y=price,col=fuel))+geom_point()+facet_grid(.~fuel)

# Facet histogram

ggplot(House,aes(x=price,fill=heat))+geom_histogram()+facet_grid(.~heat)

# Facet in boxplot

ggplot(House,aes(y=price,x=fuel,fill=air_cond))+geom_boxplot()+facet_grid(.~air_cond)

# Theme layer
ggplot(House,aes(y=price,x=living_area,col=heat))+geom_point()+theme(panel.background = element_rect("orange"))

# assigning a color to plot
ggplot(House,aes(y=price,x=living_area,col=heat))+geom_point()+theme(panel.background = element_rect("orange"),plot.background = element_rect("black"))


# Word Cloud
library(wordcloud2)

View(demoFreq)
wordcloud2(demoFreq,shape = "star")
