
# Reading the data

data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
filteredData <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

# preprocessing time (including the locale change)

datetimes <- strptime(paste(filteredData$Date, filteredData$Time), "%m/%d/%Y %H:%M:%S")
filteredData$datetime <- datetimes
Sys.setlocale("LC_TIME", "English")

###############################################################################
# Making all the plots

par(mfrow = c(2, 2), mar = c(4.2, 4, 2, 2))

# Making the plot 1

plot(filteredData$datetime, 
     filteredData$Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type = "n",
     ylim = c(0, 6),
     yaxt = "n")

lines(filteredData$datetime, filteredData$Global_active_power)
axis(2, seq(0, 6, by = 2))

# Making the plot 2

plot(filteredData$datetime, 
     filteredData$Voltage, 
     xlab = "datetime", 
     ylab = "Voltage",
     type = "n",
     yaxt = "n")

lines(filteredData$datetime, filteredData$Voltage)
axis(2, seq(234, 250, by = 4))

# Making the plot 3

plot(filteredData$datetime, 
     filteredData$Sub_metering_1,
     xlab = "", 
     ylab = "Energy sub metering",
     type = "n",
     ylim = c(0, 30),
     yaxt = "n")

lines(filteredData$datetime, filteredData$Sub_metering_1, col = "black")
lines(filteredData$datetime, filteredData$Sub_metering_2, col = "red")
lines(filteredData$datetime, filteredData$Sub_metering_3, col = "blue")

axis(2, seq(0, 30, by = 10))

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = c(1, 1),
       bty = "n")

# Making the plot 4

plot(filteredData$datetime, 
     filteredData$Global_reactive_power, 
     xlab = "datetime", 
     ylab = "Global_reactive_power",
     type = "n")

lines(filteredData$datetime, filteredData$Global_reactive_power)

# Copying the plot to PNG file

dev.copy(png, file = "plot4.png")
dev.off()

