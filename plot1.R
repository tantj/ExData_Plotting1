# Reading in the data and preparing the data for treatment


powercon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
