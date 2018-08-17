# Assignment 9 - Time series
# Task 1- Load data into R
milk<-read.csv("r_scripts/monthly-milk-production-pounds-p.csv", header = F)
View(milk)
str(milk)
milk<-milk[,-c(1)]
tsd<- ts(milk, start  = c(1962,1) ,
         end = c(1975,12) ,
         frequency = 12 )
tsdtrain<-window(tsd,start=c(1962,1),end=c(1974,12))
tsdtesting<-window(tsd,start=c(1975,1),end=c(1975,12))

par(mfrow=c(2,1))
plot(tsdtrain,ylab = "milk")
plot(diff(tsdtrain))
par(mfrow=c(1,1))
plot(decompose(tsdtrain))

# Task 2 
library(forecast)
# ARIMA Model
y = auto.arima(tsdtrain)
y
plot(tsd)
f<-forecast(y,h=12)
plot(f,col="blue")

autoplot(tsdtrain, series="Training data") +
  autolayer(fitted(y),
            series="12-step fitted values")

# comparision between 
y%>%
  forecast(h=12) %>%
  autoplot() + autolayer(tsdtesting)


# Holtswinters Exponential smoothing
plot(HoltWinters(tsdtrain))

hw<-HoltWinters(tsdtrain)

predi<-predict(hw,n.ahead = 1*12)

ts.plot(tsdtesting,predi,lty = 1:2)


# library(PerformanceAnalytics)
# milk$V1<-as.Date(as.character(milk$V1),format = "%Y-%m")
# str(milk)
# View(milk)
# library(zoo)
# library(xts)
# milkts<- read.csv.zoo("r_scripts/monthly-milk-production-pounds-p.csv", header = F, format = "%YYYY-%MM")
# as.character(milk$V1)
# paste("01",substr(milk$V1,6,8),substr(milk$V1,1,4))
# as.Date(paste("01",substr(milk$V1,6,8),substr(milk$V1,1,4)),format = "%d %m %Y")
# as.Date(paste("01",substr(milk$V1,6,8),substr(milk$V1,1,4)),format = "%d %m %Y")
# as.Date(as.character(milk$V1),format = "%Y-%m")
# as.Date("03-1994",format = "%m-%Y")
# strptime("199403", format = "%Y-%m", tz ="-")
# format(strptime(milk$V1, format = "%Y", tz ="-"),"%H:%M")
