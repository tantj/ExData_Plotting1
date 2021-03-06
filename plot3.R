# Load libraries
library(ggplot2)
library(colorspace)
library(dplyr)

# Reading in the data and preparing the data for treatment
powercon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
powercon$Date <- as.Date(powercon$Date, format = "%d/%m/%Y")
powercon <- powercon[(powercon$Date == "2007-02-01" | powercon$Date == "2007-02-02"),]
dateTime <- as.POSIXlt(paste(powercon$Date, powercon$Time, sep = " "))

# Create histogram with base plotting system
png("submetering.png", width = 480, height = 480)
plot(dateTime, powercon$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = "",
     col = "black",
     type = "l")
points(x = dateTime, y = powercon$Sub_metering_2,
       col = "red",
       type = "l")
points(x = dateTime, y = powercon$Sub_metering_3,
       col = "blue",
       type = "l")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
