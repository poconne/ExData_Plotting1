setwd("C:/Users/PC/Documents/Coursera")
install.packages("readr")
library(readr)

#call data

data <- read.table("C:/Users/PC/Documents/Coursera/household_power_consumption.txt", header = TRUE, na = "?", sep = ";")
head(data)

#Edit Date Format

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Date <- format(data$Date, "%Y-%m-%d")
head(data$Date)

#Time Format

data$Time <- strgtime(data$Time, format = "%H:%M:%S")
head(data$Time)

#Filter Dates

start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
filtered_data <- subset(data, Date >= start_date & Date <= end_date)
head(filtered_data$Date)

#Create Histogram

png("plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power,
main = "Global Active Power",
xlab = "Global Active Power (kilowatts)",
ylab = "Frequency",
col = "red")
dev.off()
