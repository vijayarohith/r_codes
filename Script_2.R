# Relational operators
v1<-c(10,20,40,30,10)
v2<-c(20,10,40,20,10)
v1==v2 # comparison operator , is to compare 2 vectors
v1=v2 #this is assignment operator
v1>v2
v1<v2
v1>=v2
# Logical Operators
# 1. AND (&) Operator
v1<-TRUE
v2<-(2>4)
v3<-v1&v2
v3
# 2. OR (|) Operator
v3<-v1|v2
# 3. Negate (!)
!(2<3)
v3<-!(5>3)
# if else Condition
t_mark<-88
if(t_mark>80)
  {
   print("Excellent") 
  }else if(t_mark>70)
    {
      print("Good")
    }else if(t_mark>60)
      {
       print("Average") 
      }else {
          print("Bad Performance")}




library(purrr)
