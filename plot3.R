## reading data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

## restricting
subjData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## converting
subjData$dt <- strptime(paste(subjData$Date, subjData$Time), "%d/%m/%Y %H:%M:%S")
subjData$Sub_metering_1 <- as.numeric(subjData$Sub_metering_1)
subjData$Sub_metering_2 <- as.numeric(subjData$Sub_metering_2)
subjData$Sub_metering_3 <- as.numeric(subjData$Sub_metering_3)

## plotting
png(filename="plot3.png", height=480, width=480)
with(subjData, {
  plot(dt, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dt, Sub_metering_2, type="l", col="red")
  lines(dt, Sub_metering_3, type="l", col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
