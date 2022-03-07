#READING THE DATASET

library(lubridate)
dataset <- read.table("./household_power_consumption.txt", sep = ";", nrows = 2879, skip = 66637, 
                      col.names = c("Date", "Time", "Global active power", "Global reactive power",
                                    "Voltage", "Global intensity", "Sub metering 1", 
                                    "Sub metering 2", "Sub metering 3"))

#PLOT 1

plot1 <- hist(dataset$Global.active.power, col = "red", ylim = c(0,1300), main = "Global active power", 
              xlab = "Global active power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()