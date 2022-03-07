#READING THE DATASET

library(lubridate)
dataset <- read.table("./household_power_consumption.txt", sep = ";", nrows = 2879, skip = 66637, 
                      col.names = c("Date", "Time", "Global active power", "Global reactive power",
                                    "Voltage", "Global intensity", "Sub metering 1", 
                                    "Sub metering 2", "Sub metering 3"))
#PLOT 3

library(dplyr)
Sys.setlocale("LC_TIME", "C")

dataT <- mutate(dataset, D_T = paste(dataset$Date, dataset$Time, sep = " ") )
dataT$D_T <- dmy_hms(dataT$D_T)

plot3 <- with(dataT, {
    plot(D_T, Sub.metering.1, ylab= "Energy sub metering", xlab = " ",type ="l")
    lines(D_T,Sub.metering.2, col="red")
    lines(D_T,Sub.metering.3, col="blue")
    legend("topright", pch = "l", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()