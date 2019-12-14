## Loading dataset and subsetting:
dataset <- read.table("/Users/home/Downloads/household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
temp <- dataset[(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"),]


## Plotting:
png("plot1.png")
hist(as.numeric(temp$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()
