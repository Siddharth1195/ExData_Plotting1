## Loading dataset and subsetting:
dataset <- read.table("/Users/home/Downloads/household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
temp <- dataset[(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"),]

## Preprocessing:
datetime <- strptime(paste(temp$Date, temp$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

## Plotting:
png("plot4.png")
par(mfrow = c(2, 2)) 
plot(datetime, as.numeric(temp$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, as.numeric(temp$Voltage), type="l", xlab="datetime", ylab="Voltage")
plot(datetime, as.numeric(temp$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(datetime, as.numeric(temp$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(temp$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, as.numeric(temp$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
