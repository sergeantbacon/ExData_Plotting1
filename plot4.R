consump <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")
consump$Date <- as.Date(consump$Date, "%d/%m/%Y")
perioddates <- as.Date(c("2007-02-01", "2007-02-02"))
consump <- subset(consump, Date >= perioddates[1] & Date <= perioddates[2])
consump$DateTime <- paste(consump$Date, consump$Time, sep=",")
consump$DateTime <- strptime(consump$DateTime, format="%Y-%m-%d,%H:%M:%S")
consump$Date <- NULL
consump$Time <- NULL
Sys.setlocale("LC_TIME", "en_US")
library(datasets)
# plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(consump, {
        # upper left
        plot(DateTime, Global_active_power, type="l", xlab="", ylab = "Global Active Power")
        # upper right
        plot(DateTime, Voltage, type="l", xlab="datetime")
        # lower left
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
        points(DateTime, Sub_metering_2, type="l", col="red")
        points(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", pch = "-", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
        # lower right
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()