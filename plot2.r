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
png(filename="plot2.png", height=480, width=480, bg="transparent")

# plot
plot(relevanttime, relevantdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close graphic device
dev.off()