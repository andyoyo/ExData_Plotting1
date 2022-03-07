#READING THE DATASET

library(lubridate)
dataset <- read.table("./household_power_consumption.txt", sep = ";", nrows = 2879, skip = 66637, 
                      col.names = c("Date", "Time", "Global active power", "Global reactive power",
                                    "Voltage", "Global intensity", "Sub metering 1", 
                                    "Sub metering 2", "Sub metering 3"))
#PLOT 2

library(dplyr)
Sys.setlocale("LC_TIME", "C")

dataT <- mutate(dataset, D_T = paste(dataset$Date, dataset$Time, sep = " ") )
dataT$D_T <- dmy_hms(dataT$D_T)

plot2 <- plot(dataT$D_T,dataT$Global.active.power,  ylab = "Global active power (kilowatts)",
              xlab = " ", type ="l")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()