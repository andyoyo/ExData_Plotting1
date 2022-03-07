#READING THE DATASET

library(lubridate)
dataset <- read.table("./household_power_consumption.txt", sep = ";", nrows = 2879, skip = 66637, 
                      col.names = c("Date", "Time", "Global active power", "Global reactive power",
                                    "Voltage", "Global intensity", 
                                    "Sub metering 1", "Sub metering 2", "Sub metering 3"))
#PLOT 4

library(dplyr)
Sys.setlocale("LC_TIME", "C")

dataT <- mutate(dataset, D_T = paste(dataset$Date, dataset$Time, sep = " ") )
dataT$D_T <- dmy_hms(dataT$D_T)

par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(dataT$D_T,dataT$Global.active.power,  ylab = "Global active power (kilowatts)",
     xlab = " ", type ="l")
plot(dataT$D_T,dataT$Voltage,  ylab = "Voltage", xlab = "datetime", type ="l")
with(dataT, {
    plot(D_T, Sub.metering.1, ylab= "Energy sub metering", xlab = " ",type ="l")
    lines(D_T,Sub.metering.2, col="red")
    lines(D_T,Sub.metering.3, col="blue")
    legend("topright", pch = "l", col = c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
           cex = 0.5, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))})
plot(dataT$D_T,dataT$Global.reactive.power, ylab = "Global_reactive_power", 
     xlab = "datetime", type ="l",lty=1,cex=0.5) 

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
