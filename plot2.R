## reading data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

## restricting
subjData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## converting
subjData$dt <- strptime(paste(subjData$Date, subjData$Time), "%d/%m/%Y %H:%M:%S")
subjData$Global_active_power <- as.numeric(subjData$Global_active_power)

## plotting
png(filename="plot2.png", height=480, width=480)
with(subjData, plot(dt, Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))
dev.off()
