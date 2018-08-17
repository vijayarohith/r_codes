# Loading Data
getwd()
d_d<-read.csv("r_scripts/Disease_data.csv")
class(d_d)
View(d_d)

str(d_d_na)

#  Convert Age column to type Numeric
d_d[,'Age'] <- as.numeric(d_d[,'Age'])

# Omit NULL values from non-numerical data fields
d_d_na<-na.omit(d_d)
d_d_na <- d_d_na[!d_d_na$sex == -1,]
levels(d_d_na$sex)<-droplevels(d_d_na$sex)
View(d_d_na)

# Put mean instead of null value
# all nummeric variable are good
# all date conversion
d_d_na$timesupper<-as.POSIXct(strptime(paste("19400418",d_d_na$timesupper), format = "%Y%m%d %H%M",tz= "-"))
library(dplyr)
d_d_na = mutate(d_d_na, onsettime = ifelse(onsettime < 1000,
                                            ifelse(onsettime < 10,
                                                   paste("000",d_d_na$onsettime,sep=""),
                                                   ifelse(onsettime<100,
                                                          paste("00",d_d_na$onsettime,sep=""),
                                                          paste("0",d_d_na$onsettime,sep=""))),
                                            onsettime))

d_d_na$onsettime<-as.character(format(strptime(d_d_na$onsettime, format = "%H%M", tz ="-"),"%H:%M"))
d_d_na$onsettime<-paste(d_d_na$onsetdate,d_d_na$onsettime)


#  Analysis and Visualization using appropriate type of graph
# 
# count(d_d_na,vars = c(7))
# 
# plot(count(d_d_na,vars = c(7)))
# plot(count(d_d_na,vars = c(8)))
# 
# tes<-count(d_d_na[,7:20], vars = c(2))
# count(d_d_na[,7:20], vars = c(1))[2,2]
# class(tes[2,2])
# 
# tes1<- c(count(d_d_na[,7:20], vars = c(1))[2,2],
#          count(d_d_na[,7:20], vars = c(2))[2,2],
#          count(d_d_na[,7:20], vars = c(3))[2,2],
#          count(d_d_na[,7:20], vars = c(4))[2,2],
#          count(d_d_na[,7:20], vars = c(5))[2,2],
#          count(d_d_na[,7:20], vars = c(6))[2,2],
#          count(d_d_na[,7:20], vars = c(7))[2,2],
#          count(d_d_na[,7:20], vars = c(8))[2,2],
#          count(d_d_na[,7:20], vars = c(9))[2,2],
#          count(d_d_na[,7:20], vars = c(10))[2,2],
#          count(d_d_na[,7:20], vars = c(11))[2,2],
#          count(d_d_na[,7:20], vars = c(12))[2,2]
#          
#          )
# 
# hist(tes[2,2])
# 
# 
# library(plyr)
# 
# class(d_d_na)
# 
# as.factor(d_d_na[,7:20])
# 
# 
# 
# d_d_na1<- table(as.character(d_d_na[,7:20],exclude = "no"))
# cou <- table(d_d_na[,7:20], exclude = "no")
# str(d_d_na1)
# class(d_d_na1)
# boxplot(as.numeric(d_d_na$baked_hamburgur),pch=1,col="red")
# barplot(cou)
# 
# boxplot(as.numeric(d_d_na$sex))
# 
# aggregate(length(d_d_na$baked_hamburgur),FUN = count, by = c(d_d_na$baked_hamburgur))
# 
# 
# 
# 
# length(d_d_na$baked_hamburgur[d_d_na$baked_hamburgur=="no"])
# length(d_d_na$baked_hamburgur)
# 
# sum(d_d_na$baked_hamburgur[d_d_na$baked_hamburgur=="no"], na.rm=TRUE)
# summary(as.numeric(d_d_na$baked_hamburgur))
# 
# # Workbook -- ignore below
# 
# str(d_d_na)
# if(d_d_na$onsettime[1] < 100) {test<-(paste("0",d_d_na$onsettime[1],sep=""))}
# 
# as.POSIXct("65", format = "%M")
# strptime("1940-04-18 6", format = "%y%m%d %H%M")
# strptime("19400418 0100", format = "%Y%m%d %H%M")
# strptime(strptime("19400418 0100", format = "%Y%m%d %H%M"), format = "%H:%M:%S")
# strptime("0006", format = "%H%M")
# 
# paste(d_d_na$onsetdate[1],d_d_na$timesupper[1])
# as.Date("30", "%M")
# format(strptime("0006", format = "%H%M", tz ="-"),"%H:%M")
# 
# format(Sys.time(), "%a %b %d %X %Y %Z")
# ?strptime
# 
# nr.of.appearances <- aggregate(x = d_d_na, 
#                                by = list(d_d_na), 
#                                FUN = length)
# 
# 


