## Step1: Load the data
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
selectedData <- rawData[rawData$Date == c("2007-02-01") | rawData$Date == c("2007-02-02"),]

## Step2: Lanuch a graphics device
png(filename = "plot1.png", width = 480, height = 480)

## Step3: Make the plot
selectedData$Global_active_power <- as.numeric(as.character(selectedData$Global_active_power))
hist(selectedData$Global_active_power, axes = FALSE, col = "red",
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)")
axis(side = 1, at = seq(0,6,2))
axis(side = 2, at = seq(0,1200,200))

## Step4: Close the graphics device
dev.off()
