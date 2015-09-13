df <- read.table("household_power_consumption.txt", sep= ";",header = FALSE, col.names = c("Date","Time","Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensity","SM1","SM2","SM3"),stringsAsFactors = FALSE)

##Subseting data
dat <- df[df$Date %in% c("1/2/2007","2/2/2007"),]

## Date Subsetting
DT <- strptime(paste(dat$Date,dat$Time, sep = " " ),"%d/%m/%Y %H:%M:%S")

## Numeric conversion of strings
EM1 <- as.numeric(dat$SM1)
EM2 <- as.numeric(dat$SM2)
EM3 <- as.numeric(dat$SM3)
GAP <- as.numeric(dat$Global_Active_Power)
GRP <- as.numeric(dat$Global_Reactive_Power)
vol <- as.numeric(dat$Voltage)

## Plotting the charts
png("plot4.png",width = 480, height = 480, units="px")
par(mfrow=c(2,2))
plot(DT,GAP,type = "l",xlab=" ",ylab="Global Active Power (kilowatts)")
plot(DT,vol,type = "l",xlab="datetime",ylab="Voltage")
plot(DT,EM1,type = "l",xlab=" ",ylab="Energy Sub Metering")
lines(DT,EM2,col="red",type = "l")
lines(DT,EM3,col= "blue",type = "l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty= ,lwd = 2.5, col=c("black","red","blue"), bty="n")
plot(DT,GRP,type = "l",xlab="datetime",ylab="Global_reactive_power")
dev.off()