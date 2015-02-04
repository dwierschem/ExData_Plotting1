dat <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", colClasses = c("character", "character", rep("numeric", 7)), dec=".", na.strings = "?")

## Convert date to Date format
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")


## Convert time to time format
dat$Time <- strptime(dat$Time, "%H:%M:%OS")

##get requested data
usedat <- subset(dat, dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")

## create and print plot #2 to png file

plot(usedat$Global_active_power,  type="l", 
     ann=FALSE, axes=F)
box()
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,8,2))
title(ylab="Global Active Power (kilowatts)", cex.lab=.6)

dev.copy(png, width = 480, height = 480, units = "px", file = "plot2.png")
dev.off()       

         
         
