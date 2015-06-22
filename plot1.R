# Load libraries
library(ggplot2)
library(colorspace)

# Reading in the data and preparing the data for treatment
powercon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
powercon$Date <-as.Date(powercon$Date, format = "%d/%m/%Y")
powercon$Time <- strptime(powercon$Time, format = "%H:%M:%S")
powercon <- powercon[(powercon$Date == "2007-02-01" | powercon$Date == "2007-02-02"),]

# Create histogram with base plotting system
png("globalactivepower.png", width = 480, height = 480)
with(powercon, hist(powercon$Global_active_power, 
                    xlab = "Global Active Power (kilowatts)", 
                    ylab = "Frequency",
                    main = "Global Active Power",
                    col = "red"))
dev.off()
