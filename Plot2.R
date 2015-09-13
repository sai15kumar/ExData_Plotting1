df <- read.table("household_power_consumption.txt", sep= ";",header = FALSE, col.names = c("Date","Time","Global_Active_Power","Global_Reactive_Volatage","Voltage","Global_Intensity","SM1","SM2","SM3"),stringsAsFactors = FALSE)

##Subseting data
data <- df[df$Date %in% c("1/2/2007","2/2/2007"),]

## Date Subsetting
DT <- strptime(paste(data$Date,data$Time, sep = " " ),"%d/%m/%Y %H:%M:%S")

## Numeric conversion of strings
GAP <- as.numeric(data$Global_Active_Power)


## Plotting the chart
png("plot2.png",width = 480, height = 480, units="px")
plot(DT,GAP,type = "l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()