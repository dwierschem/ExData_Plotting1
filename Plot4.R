dat <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", colClasses = c("character", "character", rep("numeric", 7)), dec=".", na.strings = "?")

## Convert date to Date format
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")


## Convert time to time format
dat$Time <- strptime(dat$Time, "%H:%M:%OS")

##get requested data
usedat <- subset(dat, dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")



png(width = 480, height = 480, units = "px", file = "plot4.png")

par(mfcol=c(2,2), oma=c(2,1,3,1), mar=c(4,5,2,1))


## create and print plot #2 

plot(usedat$Global_active_power,  type="l", 
     ann=FALSE, axes=F)
box()
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"), cex.axis=.6)
axis(2,at=seq(0,8,2),cex.axis=.6)
title(ylab="Global Active Power", cex.lab=.6)

## create and print plot #3 

plot(usedat$Sub_metering_1,  type="l", 
     ann=FALSE,axes=F)
points(usedat$Sub_metering_2,  type="l", col = 'red')
points(usedat$Sub_metering_3,  type="l", col = 'blue')

box()
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=.6)
axis(2,at=seq(0,40,10),cex.axis=.6)
title(ylab="Energy sub metering", cex.lab=.6)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), cex=.5,
       lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"))


## create and print plot #4a 

plot(usedat$Voltage,  type="l", 
     ann=FALSE, axes=F)
box()
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=.6)
axis(2,at=seq(234,246,4),cex.axis=.6)
title(ylab="Voltage", xlab="datetime",cex.lab=.6)

## create and print plot #4b

plot(usedat$Global_reactive_power,  type="l", 
     ann=FALSE, axes=F)
box()
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=.6)
axis(2,at=seq(0.0,0.5,.1),cex.axis=.6)
title(ylab="Global_reactive_power", xlab="datetime", cex.lab=.6)

dev.off()         

