library(forecast)
install.packages("foreign")
library(foreign)
install.packages("xts")
library(xts)
install.packages("zoo")
library(zoo)
install.packages("astsa")
install.packages("tseries")


#GLOBAL AVERAGE TEMPERATURE 
first_data = read.csv("global_1900.csv", header = T)
View(first_data)
first_data = ts(na.omit(first_data[,4]), start = 1900, frequency = 12)
plot(first_data, col= "red",type = "o",ylab = "gat", xlab= "year", 
     main = "Global average temperature anomalies (1900 - 2020)") 
abline(v=1980)


gat = read.csv("global_average_temp.csv", header = T)
View(gat)
gat = ts(na.omit(gat[,3]), start = 1980, frequency = 12) #naomit para tomar solo la columna3
plot(gat, col= "blue",type = "b",ylab = "anomalies", xlab= "year", main = "Global temperature anomalies") 
sd(gat)
mean(gat)
seasonplot(gat, col = rainbow(12), year.labels = T)
dec_gat = decompose(gat)
boxplot(gat ~ cycle(gat), col=rgb(0,0,1), xlab = "Month",
        ylab = "Gat")

autoplot()

acf(gat)
pacf(gat)

modelo_gat = auto.arima(gat, d = 1, D = 1, stepwise = F, approximation = T, trace = T)

## Best model: ARIMA(3,1,0)(2,1,0)[12]  

fcs_gat = forecast(modelo_gat,h = 36,level = 90 )
summary(fcs_gat)

library(ggplot2)

autoplot(fcs_gat)+
  ggtitle("Forecast for the following 36 months")+
  labs(x = "year")

##emisiones vs gat

emis_gat = read.csv("emiss_gat.csv", header = T)
View(emis_gat)


plot(emis_gat$Period_Time, emis_gat$Em_CO2,
     type = "l",
     col="blue", 
     bty="l",
     xlab= " ", ylab="GT ",
     las=1, #orientacion de los numeros en el eje
     cex.axis=.75)
par(new = T)#sobreponer graficos

plot(emis_gat$Period_Time, emis_gat$gat,
     type="l",
     col="red",
     bty= "l",
     xaxt="n",#sin numeros
     yaxt="n",
     xlab="year", ylab = " ",
     cex.axis=.75)
axis(4, las = 1, cex.axis=.75)

legend("topleft", #ubicación de la leyenda
       legend=c("CO2","gat (Celsius)" ),
       col = c("blue","red"),
       lty = 1,
       cex = 0.8,
       bty="n")





