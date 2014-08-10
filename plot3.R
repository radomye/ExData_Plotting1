## Step1: Load the data
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date <- paste(rawData$Date, rawData$Time)
datetime <- strptime(date, "%d/%m/%Y %H:%M:%S")
rawData <- cbind(rawData, datetime)
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
selectedData <- rawData[rawData$Date == c("2007-02-01") | rawData$Date == c("2007-02-02"),]

## Step2: Lanuch a graphics device
png(filename = "plot3.png", width = 480, height = 480)

## Step3: Make the plot
selectedData$datetime <- as.POSIXlt(selectedData$datetime)
selectedData$Sub_metering_1 <- as.numeric(as.character(selectedData$Sub_metering_1))
selectedData$Sub_metering_2 <- as.numeric(as.character(selectedData$Sub_metering_2))
selectedData$Sub_metering_3 <- as.numeric(as.character(selectedData$Sub_metering_3))
plot(selectedData$datetime, selectedData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = selectedData$datetime, selectedData$Sub_metering_2, col = "red")
lines(x = selectedData$datetime, selectedData$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Step4: CLose the graphics device
dev.off()