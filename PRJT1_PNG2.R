setwd("C:/Users/PC/Documents/Coursera")
install.packages("readr")
library(readr)

#call data

data <- read.table("C:/Users/PC/Documents/Coursera/household_power_consumption.txt", header = TRUE, na = "?", sep = ";")
head(data) #TEST

#Create DateTime Format

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
head(data$DateTime) #TEST

#Filter Dates

filtered_data <- subset(data, DateTime >= as.POSIXct("2007-02-01") & DateTime <= as.POSIXct("2007-02-03"))

#Create Line Graph

png("plot2.png", width = 480, height = 480)
plot(filtered_data$DateTime, 
filtered_data$Global_active_power, 
type = "l", 
xlab = "",
ylab = "Global Active Power (kilowatts)"
)
dev.off()
