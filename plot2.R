## this code reads the file paced in my default working dircetory.

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data more specifically the Date column for February 2007 only

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##strptime function used to modify dates
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

## file creation and plot.
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

