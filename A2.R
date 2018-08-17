## Question 1
First_Hundred<-c(1:100)
for (e in First_Hundred)
  {
  if(e%%2 == 0)
  {First_Hundred[e]<-"Even"}
  else {First_Hundred[e]<-"Odd"}
}

## Question 2
View(iris)
count<-0
for (e in iris$Sepal.Length)
  { 
    if( e > 6.5 ) 
    {
    count=count+1
    }
  }
paste("No. of times sepal length greater than 6.5 =",count)

## Question 3
View(CO2)
total<-nrow(CO2)
valid=NULL
while(total)
  {
    if( CO2$Type[total] == "Mississippi" & CO2$Treatment[total] == "chilled")
    {
      valid<-c(valid,CO2$uptake[total])
    }
   total =total - 1
  }
mean(valid)

## Question 4
tapply(CO2$uptake,CO2$Treatment,mean)
tapply(CO2$uptake,CO2$Treatment,min)
tapply(CO2$uptake,CO2$Treatment,max)
tapply(CO2$uptake,CO2$Treatment,median)

## Question 5
View(swiss)
invoke_map(list(min_fert="min",max_infMort="max"),list(swiss$Fertility,swiss$Infant.Mortality))

## Question 6
dice<-function(){sample(1:6,1)}
dice()
