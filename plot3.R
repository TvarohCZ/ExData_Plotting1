
# Reading the data

data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
filteredData <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

# preprocessing time (including the locale change)

datetimes <- strptime(paste(filteredData$Date, filteredData$Time), "%m/%d/%Y %H:%M:%S")
filteredData$datetime <- datetimes
Sys.setlocale("LC_TIME", "English")

# Making the plot

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
       lty = c(1, 1))

# Copying the plot to PNG file

dev.copy(png, file = "plot3.png")
dev.off()

