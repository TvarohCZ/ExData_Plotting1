
# Reading the data

data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
filteredData <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

# Making the plot

hist(filteredData$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     col = "Red",
     axes = FALSE)

axis(1, seq(0, 6, by = 2))
axis(2, seq(0, 1200, by = 200))

# Copying the plot to PNG file

dev.copy(png, file = "plot1.png")
dev.off()

