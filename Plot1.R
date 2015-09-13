df <- read.table("household_power_consumption.txt", sep= ";",header = FALSE, col.names = c("Date","Time","Global_Active_Power","Global_Reactive_Volatage","Voltage","Global_Intensity","SM1","SM2","SM3"),stringsAsFactors = FALSE)

##Subsetting the Data
data <- df[df$Date %in% c("1/2/2007","2/2/2007"),]

## Numeric conversion of strings
GAP <- as.numeric(data$Global_Active_Power)

##Plotting the Chart
png("plot1.png",width = 480, height = 480, units="px")
hist(GAP, main="Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()