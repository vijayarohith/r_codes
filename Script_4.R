install.packages("dplyr")
library(dplyr)
library(hflights)
View(hflights)

# creating subsets using column name
fhlights_subset<- select(hflights,Year,Month,FlightNum)
View(fhlights_subset)
# using column number
fhlights_subset2<- select(hflights,1,2,8)
View(fhlights_subset2)
# selecting variable/column name with a defined text string
fhlights_subset3<- select(hflights,contains("Time"))
View(fhlights_subset3)
# specifying column from - to number
fhlights_subset4<- select(hflights,1:5)
View(fhlights_subset4)
# selecting columns between specified columns
fhlights_subset5<- select(hflights,Year : FlightNum)
View(fhlights_subset5)
# columns with character starts with or ends with
fhlights_subset6<- select(hflights,starts_with("Day"), ends_with("Time"))
View(fhlights_subset6)

# Functions
mark<-read.csv("/home/rohy/r_scripts/marks.csv")
View(marks)

# Create new column with data from existing column
mark_total = mutate(marks, total_marks = Physics + Chemistry + Maths)
View(mark_total)

marks_percentage = mutate(mark_total, percent = total_marks/3)
View(marks_percentage)

passingstatus = mutate(marks_percentage, passstatus = ifelse(percent > 40 , "pass","fail"))
View(passingstatus)

# Filter records basis of values in the table(based obeservation)
View(mtcars)
mtcarswithgt4cyl <- filter(mtcars,cyl>4)
View(mtcarswithgt4cyl)
# Filter out records with multiple columns
mtcarswithGT150_GearEQ5 <- filter(mtcars,hp>150 & gear == 5)
View(mtcarswithGT150_GearEQ5)

# Arrange data based on a column
milage_performance <- arrange(mtcars,mpg)
View(milage_performance)

# by default its asending, for descending order use desc
milage_performance_desc <- arrange(mtcars,desc(mpg))
View(milage_performance_desc)

# Summarise function

house<- read.csv("/home/rohy/r_scripts/housingdata.csv")
View(house)

summarise(house, max_price = max(PropertyValue))
summarise(house, min_price = min(PropertyValue))
summarise(house, sum_price = sum(PropertyValue))

# Piping function in R (to use more than one condition)
library(hflights)
View(hflights)

View(hflights %>% select(contains("Time")) %>% filter(AirTime>100))

hflightsSubset = hflights %>% filter(UniqueCarrier=="WN") %>% summarise(max(AirTime,na.rm = T))
View(hflightsSubset)

#  Preparing Tables
emp_des <- data.frame(name=c("Rohith","Kishore","Krishna","Govind"),des=c("CTO","CEO","SDE","COO"))
emp_sal<-data.frame(name=c("Rohith","Kishore","Idiot","Govind"),sal=c(5555,7777,864,997))

# left join
left_join(emp_des,emp_sal,by="name")

# right join
right_join(emp_des,emp_sal,by="name")

# Full join
full_join(emp_des,emp_sal,by="name")

# data.table
library(data.table)
View(iris)
as.data.table(iris)->iris.dt
iris.dt[2:5]
iris.dt[c(1,4,5)]
iris.dt[Species=="virginica"]
