## reading data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

## restricting
subjData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## converting
subjData$Global_active_power <- as.numeric(subjData$Global_active_power)

## plotting
png(filename="plot1.png", height=480, width=480)
hist(subjData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
