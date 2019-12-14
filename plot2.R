## Loading dataset and subsetting:
dataset <- read.table("/Users/home/Downloads/household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
temp <- dataset[(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"),]

## Plotting:
datetime <- strptime(paste(temp$Date, temp$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
png("plot2.png")
plot(datetime, as.numeric(temp$Global_active_power), type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
