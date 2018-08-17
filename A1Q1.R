## Question1
random<-c(rnorm(3,5,1),rnorm(3,3,3),rnorm(4,1,4))
random

## Question 2
LogExpo<-c(log(1:5),exp(6:10))
LogExpo

## Question 3
negative_thousand<-seq(-1000,0,1)
thousand<-seq(0,1000,1) 
sum_thousand<-negative_thousand+thousand
sum_thousand

## Question 4
final_thousand<-negative_thousand+thousand
final_thousand[500] # 500th value in vector
first_hundred<-final_thousand[1:100]
last_hundred<-final_thousand[900:1000]
weired_set<-final_thousand[321:764]

## Question 5
book_details<-list(book_name=c("book1","book2","book3","book4","book5"),author_name=c("author1","author2","author3","author4","author5"),book_cost=c(1000,2000,3000,4000,5000))

## Question 6
book_details$book_name
book_details$author_name
book_details$book_cost
book_details[[1]][4]
book_details[[2]][2]
book_details[[3]][4]

## Question 7
View(women)
data("women")
women[c(6,2),]
women[seq(2,nrow(women),2),]
tail(women,4)

## Questions 8
student=data.frame(name=c("student1","student","student3","student4","student5","student6","student7","student8","student9","student10"),Department=c("CSE","CSE","CSE","MECH","CIVIL","MECH","MECH","MECH","MECH","MECH"),CGPA=c(9,8,9,7,8,9,8,7,8,7),Placement=c(T,F,T,T,T,T,T,T,F,F),stringsAsFactors = F)
