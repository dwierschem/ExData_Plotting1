dat <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", colClasses = c("character", "character", rep("numeric", 7)), dec=".", na.strings = "?")

## Convert date to Date format
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")


## Convert time to time format
dat$Time <- strptime(dat$Time, "%H:%M:%OS")

##get requested data
usedat <- subset(dat, dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")


## create and print plot #1 to png file

hist(usedat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = paste("Global Active Power"))
dev.copy(png, width = 480, height = 480, units = "px", file = "plot1.png")
dev.off()         
         

        
