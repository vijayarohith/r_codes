library(R6)
## Object generator R6
Fruit<-R6Class("Fruit", private = list(name="Apple",cost=(100)))
apple1<-Fruit$new()
apple1
apple2<-Fruit$new()
## Object generator assigning a function with R object
Fruit_Gen<-R6Class("Fruit",private = list(name=NA,cost=NA),public = list(set_name=function(x){private$name=x},set_cost=function(x){private$cost=x}))
apple<-Fruit_Gen$new()
apple$set_name("Apple")
apple$set_cost(1000)
apple
orange<-Fruit_Gen$new()
orange$set_name("Orange")
orange$set_cost(210)
orange
## instead if assigning value after object creation, 
## we can pass the value for the function during object creation using initilize
Food_gen<-R6Class("Food",private = list(name=NA,cost=NA),public = list(initialize = function(x,y){
                                                                                                private$name=x 
                                                                                                private$cost=y
                                                                                                }
                                                                                  
                                                                       )
                  )
pizza<-Food_gen$new("Pizza", 400)
pizza
## initilize multiple values
chicken<-Food_gen$new(c("Bucket Chicken","Chicken Burger","Chicken Dosa"),c(800,400,200))
class(chicken)
## Active binding
Fruit_Gen<-R6Class("Fruit",private = list(..name=NA,..cost=NA),active = list(name=function(x){private$..name=x},cost=function(x){private$..cost=x}))
fig<- Fruit_Gen$new()
fig$name<-"Fig"
fig$cost<-300
fig
