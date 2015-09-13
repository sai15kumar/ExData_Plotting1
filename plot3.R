df <- read.table("household_power_consumption.txt", sep= ";",header = FALSE, col.names = c("Date","Time","Global_Active_Power","Global_Reactive_Volatage","Voltage","Global_Intensity","SM1","SM2","SM3"),stringsAsFactors = FALSE)
##Subseting data
data <- df[df$Date %in% c("1/2/2007","2/2/2007"),]

## Date Subsetting
DT <- strptime(paste(data$Date,data$Time, sep = " " ),"%d/%m/%Y %H:%M:%S")

## Numeric conversion of strings
EM1 <- as.numeric(data$SM1)
EM2 <- as.numeric(data$SM2)
EM3 <- as.numeric(data$SM3)

## Plotting the charts
png("plot3.png",width = 480, height = 480, units="px")
plot(DT,EM1,type = "l",xlab=" ",ylab="Energy Sub Metering")
lines(DT,EM2,col="red",type = "l")
lines(DT,EM3,col= "blue",type = "l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,lwd = 2.5, col=c("black","red","blue"))
dev.off()