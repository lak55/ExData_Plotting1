data_file <- "C://Users/Mardi/ds2015/data/household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data_globalActivePower <- as.numeric(data_subset$Global_active_power)
data_globalReactivePower <- as.numeric(data_subset$Global_reactive_power)
data_voltage <- as.numeric(data_subset$Voltage)
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
subMetering2 <- as.numeric(data_subset$Sub_metering_2)
subMetering3 <- as.numeric(data_subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 


plot(datetime, data_globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, data_voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, data_globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
