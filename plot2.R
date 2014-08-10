## Step1: Load the data
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date <- paste(rawData$Date, rawData$Time)
datetime <- strptime(date, "%d/%m/%Y %H:%M:%S")
rawData <- cbind(rawData, datetime)
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
selectedData <- rawData[rawData$Date == c("2007-02-01") | rawData$Date == c("2007-02-02"),]

## Step2: Lanuch a graphics device
png(filename = "plot2.png", width = 480, height = 480)

## Step3: Make the plot
selectedData$Global_active_power <- as.numeric(as.character(selectedData$Global_active_power))
selectedData$datetime <- as.POSIXlt(selectedData$datetime)
plot(selectedData$datetime, selectedData$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts")

## Step4: Close the graphics device
dev.off()
