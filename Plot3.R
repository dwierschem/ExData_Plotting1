dat <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", colClasses = c("character", "character", rep("numeric", 7)), dec=".", na.strings = "?")

## Convert date to Date format
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")


## Convert time to time format
dat$Time <- strptime(dat$Time, "%H:%M:%OS")

##get requested data
usedat <- subset(dat, dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")


## create and print plot #3 to png file

plot(usedat$Sub_metering_1,  type="l", 
     ann=FALSE,axes=F)
points(usedat$Sub_metering_2,  type="l", col = 'red')
points(usedat$Sub_metering_3,  type="l", col = 'blue')

box()
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,40,10))
title(ylab="Energy sub metering", cex.lab=.6)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), cex=.5,
       lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"))

dev.copy(png, width = 480, height = 480, units = "px", file = "plot3.png")
dev.off()         
 
         
