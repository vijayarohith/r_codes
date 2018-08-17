## Question 1 Load all required libraries
library(dplyr)
house<-read.csv("/home/rohy/r_scripts/housingdata.csv")

## Question 2
str(house)

# Question 3
head(select(house,Gender,Education,Income),5)
head(select(house,Gender:Loan_Period),5)
head(select(house,-Gender,-Record),5)
g1=head(mutate(house,var2=PropertyValue/Income))
g2=head(mutate(house,var2=PropertyValue/Loan_Period))

# Question 4
g3<-filter(house,PropertyValue < 80000 | PropertyValue >150000)
head(g3,5)
g4<-filter(house,PropertyValue > 1000000 | Income < 3185)
head(g4,5)
str(g4)
g5<-filter(house,Income < 3185 & Property_Purchased == "Y")
head(g5,5)
bought<-filter(house,Property_Purchased == "Y")
head(arrange(bought,Income),5)
head(arrange(bought,Gender),5)
head(bought %>% arrange(Gender,.BY=Education),5)
notbought<-filter(house,Property_Purchased == "N")
head(arrange(notbought,Income),5)
head(arrange(notbought,Gender),5)     
head(notbought %>% arrange(Gender,.BY=Education),5)
head(arrange(house,Gender,.BY=desc(Income)),5)

# Question 5

summarise(house,min_income=min(Income),max_icome=max(Income))
summary(house$Income)
summary(house$PropertyValue)
summary(house$Loan_Period)

# Questions 6

house %>% mutate(var1=PropertyValue/Income) %>% filter(var1 > 50) %>% summarise(avg=mean(var1))

# Question 7

house %>% group_by(Education) %>% summarise(avg_income = mean(Income),avg_value=mean(PropertyValue)) %>% arrange(avg_income,.BY=avg_value)
