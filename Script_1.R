a = 1
c = a - 5
A
# R is a case sensitive language
a
# place a hash and start writing comments
# Create string variable
Student_Name <- "Rohith"
Student_FirstName = "Vijaya"
# <- or = are both assignment operators for string variables.
# To find class of particular object
class(Student_Name)
class(c)
# to list all the objects create by me in this R system
ls()
# Arithmatic functions in R
5+8
9/2
# power / modulus
2^3
# Exponentiation
15%%4
# Logical class
isNull <- TRUE
class(isNull)
# Multiple Values in an object. Concatination function - c
a = c(1,2,3,4,5,6,7,8,9)
a
# object a is a vector coz its a 1 dimention 
Studnet_names = c("Rohith","Govind","Krishan","Kishore")
Studnet_names
# Can be a vector can be numberic, character or logical
isAllNull <- c(TRUE,FALSE,FALSE,TRUE,T,F,T,T)
isAllNull
# logical value should be written in Captital letters. eg TRUE instead of true
# below are examples of numeric and character vectors
# numeric vector
temperature<-c(32,43,32,21,32,32,34)
temperature
class(temperature)
# character vector
fruit<-c("Apple","Orange","banana")
fruit
class(fruit)
# Creating List, use list function
climate<-list(c(42,32,32,23,12),c("Y","N","N","N","Y"))
climate
# to name the column in the list, use names function
names(climate)=c("Temperature","Rain")
climate
# merge 2 vectors of different class , more than 2 vectors can be merged
fruit
class(fruit)
cost<-c(24,45,32)
cost
class(cost)
fruits_details<- list(fruit,cost)
fruits_details
class(fruits_details)
# merge 2 list
country<-list("United States","Russia","India")
city<-list("Washington DC","Mascow","Chennai")
merge_list<-list(country,city)
merge_list
# vector and list are 1 dimentional object
# creating a matrix
temperature
precipitation<-c(100,101,201,101,32,333,222)
climate_matrix<-matrix(c(temperature,precipitation),nrow=2,ncol=7,byrow = T)
# nrow specifies no. of input vectors, ncol specifies no. of values in a vector,
# byrow is to set to print each vector in straight line. Matrix can be done for same object type.
climate_matrix

# to assign a column and row name
column_name<-c("mon","tue","wed","thu","fri","sat","sun")
row_name<-c("Temperature","Precipitation")
# creating matrix with row and column names
climate_matrix<-matrix(c(temperature,precipitation),nrow=2,ncol=7,byrow = T,dimnames = list(row_name,column_name))
climate_matrix

# directly create matrix with values
m1<-matrix(c(11,21,31,41,51,61),nrow =2)
m1
#no of column is automatically calculated  by R, or we can explicitely mention.
m2<-matrix(c(11,21,31,41,51,61),nrow =2, ncol = 3)
m2
m3<-matrix(c(21,31,41,51,61,71),nrow =2)
m3
# calculations with matrix like additon, subtraction , multiplication
result<-m1+m3
result
result<-m1-m3
result
result<-result +(m1*m3)
result
# creating dataframe for storing different type of vectors
# for 4 days
climate.data = data.frame(day_of_week=c(1,2,3,4),day=c("sun","mon","tue","thu"),temperature=c(24,35,23,44),precipitation=c(102,101,111,121),rain=c("Y","N","N","Y"),date=as.Date(c("2018-01-10","2018-02-11","2018-04-18","2018-05-16")),stringsAsFactors = F)
climate.data
class(climate.data)
str(climate.data)
# str gets the datatype details with values of dataframe 
# indexing dataframe, [row,column]
# extracting row omly
result<-climate.data[1:2,]
result
# extracting column only
result<-climate.data[,c(1,3)]
result
# extraction of specific rows and columns can also be done
# for rest of 3 days
climate.data.new = data.frame(day_of_week=c(5,6,7),day=c("fri","sat","sun"),temperature=c(35,23,44),precipitation=c(101,111,121),rain=c("N","N","Y"),date=as.Date(c("2018-08-11","2018-6-18","2018-09-16")),stringsAsFactors = F)
climate.data.new
# use row bind i.e rbind to bind 2 dataframe
climate.final<-rbind(climate.data,climate.data.new)
climate.final
#subsetting data
#vector subsetting
two<-seq(1,10,1)
two
two[1]
two[5]
two[2:5]
two[c(2,5,7)]
two[-5]
two[-2:-5]
two[-c(2,5,7)]
#list subsetting
cars<-list(name=c("mustang","volvo","bmw"),cost=c(15000,30030,30233),color=c("red","blue","green"))
cars
cars$name
cars[1]
cars[2]
cars[3]
cars[[1]][2] # hirachy of elements
# defalut table available, use View function to display in table format. Note : V is caps in function View
View(mtcars)
class(mtcars)
varr=mtcars[1:5,]
varr
varr=mtcars[,1:7]
varr
varr=mtcars[1:5,1:7]
varr
mtcars$mpg
mpgonly=mtcars$mpg
mpgonly
View(iris)
# concept of packages
# step 1 install Package from pakages tab. data comes from CRAN(Central R Archive Network)
# Step 2 configure the package
library(MASS)
library(help=MASS)
View(Boston)

