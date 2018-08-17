library(forecast)

# comes with R base package
data("AirPassengers")
AP <- AirPassengers
class(AP)
View(AP)

# detrending plot
par(mfrow=c(1,1))
plot(AP,ylab = "passengers(1000s)")

par(mfrow=c(1,2))
plot(AP,ylab = "passengers(1000s)")
plot(diff(AP))

par(mfrow=c(2,1))
plot(AP,ylab = "passengers(1000s)")
plot(diff(AP))

par(mfrow=c(1,1))
plot(decompose(AP))

# Arima, predict for next 6 months
y = auto.arima(AP)
plot(forecast(y,h=6))

# Holtswinters Exponential smoothing
plot(HoltWinters(AirPassengers))
AP.hw<-HoltWinters(AirPassengers)
ap.predict<-predict(AP.hw,n.ahead = 10*12)
ts.plot(AirPassengers,ap.predict,lty = 1:2)
