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

# Create graph
png("plot1.png")
hist(dat$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()