# Read csv file
electricitydata <- read.csv("household_power_consumption.txt", sep=";", colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")

# Convert to time
electricitytime <- strptime(paste(electricitydata$Date,electricitydata$Time), format="%d/%m/%Y %H:%M:%S")

# Convert to date
electricitydate <- as.Date(electricitytime, "%d/%m/%Y")

# Only consider data between 2007-02-01 and 2007-02-02
relevantdata <- subset(electricitydata, electricitydate >= "2007-02-01" & electricitydate < "2007-02-03")

# Only consider date between 2007-02-01 and 2007-02-02
relevanttime <- subset(electricitytime, electricitydate >= "2007-02-01" & electricitydate < "2007-02-03")

# Open graphic device 
png(filename="plot4.png", height=480, width=480, bg="transparent")

# divide screen to 2x2
par(mfrow=c(2,2))

# subplot 1
plot(relevanttime, relevantdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# subplot 2
plot(relevanttime, relevantdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# subplot 3

# plot sub meter 1
plot(relevanttime, relevantdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

# plot sub meter 2
lines(relevanttime, relevantdata$Sub_metering_2, type="l", col="red")

# plot sub meter 3
lines(relevanttime, relevantdata$Sub_metering_3, type="l", col="blue")

# add legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n")

# subplot 4
plot(relevanttime, relevantdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close graphic device
dev.off()