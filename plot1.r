# Read csv file
electricitydata <- read.csv("household_power_consumption.txt", sep=";", colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")

# Convert to time
electricitytime <- strptime(paste(electricitydata$Date,electricitydata$Time), format="%d/%m/%Y %H:%M:%S")

# Convert to date
electricitydate <- as.Date(electricitytime, "%d/%m/%Y")

# Only consider data between 2007-02-01 and 2007-02-02
relevantdata <- subset(electricitydata, electricitydate >= "2007-02-01" & electricitydate < "2007-02-03")

# Open graphic device 
png(filename="plot1.png", height=480, width=480, bg="transparent")

# plot
hist(relevantdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Close graphic device
dev.off()