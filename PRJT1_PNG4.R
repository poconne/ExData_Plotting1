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

#Create 4 Line Graphs

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(filtered_data$DateTime, 
filtered_data$Global_active_power,
type = "l",
xlab = "",
ylab = "Global Active Power (kilowatts)"
)
plot(filtered_data$DateTime,
filtered_data$Voltage,
type = "l",
xlab = "DateTime",
ylab = "Voltage"
)
plot(filtered_data$DateTime,
filtered_data$Sub_metering_1,
type = "l",
xlab = "",
ylab = "Energy sub metering"
)
lines(filtered_data$DateTime,
filtered_data$Sub_metering_2,
col = "red"
)
lines(filtered_data$DateTime,
filtered_data$Sub_metering_3,
col = "blue"
)
legend("topright",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
col = c("black", "red", "blue"),
lty = 1,
bty = "n"
)
plot(filtered_data$DateTime,
filtered_data$Global_reactive_power,
type = "l",
xlab = "DateTime",
ylab = "Global reactive power"
)
dev.off()
