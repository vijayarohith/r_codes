## Question 1
library(R6)

## Question 2
Football_Generator<-R6Class("Football_Generator",private=list(Player_Name=NA,Player_Club=NA,Player_Salary=NA),
                                                  public=list(set_name=function(x){private$Player_Name=x},
                                                                set_club=function(x){private$Player_Club=x},
                                                                set_salary=function(x){private$Player_Salary=x}
                                                                )
)

## Question 3
ron<-Football_Generator$new()
ron$set_name("ron")
ron$set_club("clubzy")
ron$set_salary(50000)
jon<-Football_Generator$new()
ron$set_name("jon")
ron$set_club("clubzy")
ron$set_salary(30000)
ron
jon

## Question 4
Movie_Generator<-R6Class("Movie_Generator",private = list(Movie_Name=NA,Protagonist_Name=NA,Movie_Budget=NA),
                                            public = list(initialize=function(x,y,z){private$Movie_Name=x
                                                                                      private$Protagonist_Name=y
                                                                                      private$Movie_Budget}))

## Question 5

Notebook<-Movie_Generator$new("Notebook","Noah",2.6)
Notebook                         

## Question 6

Vegetable_Generator<-R6Class("Vegetable_Generator",private = list(..Vegitable_Name=NA,..Vegitable_Cost=NA),
                             active = list(Vegitable_Name=function(x){private$..Vegitable_Name=x},
                                           Vegitable_Cost=function(x){private$..Vegitable_Cost=x})
                             )

## Question 7
carrot<-Vegetable_Generator$new()
carrot$Vegitable_Name<-"Carrot"
carrot$Vegitable_Cost<-58
carrot
beans<-Vegetable_Generator$new()
beans$Vegitable_Name<-"Beans"
beans$Vegitable_Cost<-33
beans