library(lubridate)

# Read data from txt file with ';' separater and strings as '?'
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

# Work with dates and times using libridate
dat$Date <- dmy(dat$Date)
dat$Time <- hms(dat$Time)

# Subset to desired timeframe
dat <- subset(dat, year(Date) == 2007)
dat <- subset(dat, month(Date) == 2)
dat <- subset(dat, day(Date) == 1 | day(Date) == 2)

#Create DateTime column to handle x-axis
dat$DateTime <- dat$Date + dat$Time

# Create graph
png("plot3.png")
plot(dat$DateTime, dat$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_1)
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()