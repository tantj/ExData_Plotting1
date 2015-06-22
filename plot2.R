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
png("globalactivepowerLine.png", width = 480, height = 480)
plot(dateTime, powercon$Global_active_power, 
    ylab = "Global Active Power (kilowatts)", 
    type = "l")
dev.off()
