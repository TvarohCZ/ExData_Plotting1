
# Reading the data

data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
filteredData <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

# preprocessing time (including the locale change)

datetimes <- strptime(paste(filteredData$Date, filteredData$Time), "%m/%d/%Y %H:%M:%S")
filteredData$datetime <- datetimes
Sys.setlocale("LC_TIME", "English")

# Making the plot

plot(filteredData$datetime, 
     filteredData$Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type = "n",
     ylim = c(0, 6),
     yaxt = "n")

lines(filteredData$datetime, filteredData$Global_active_power)

axis(2, seq(0, 6, by = 2))

# Copying the plot to PNG file

dev.copy(png, file = "plot2.png")
dev.off()

