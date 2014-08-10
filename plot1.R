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
# plot 1
png(filename="plot1.png", width=480, height=480)
hist(consump$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()