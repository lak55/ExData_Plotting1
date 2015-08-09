data_file <- "C://Users/Mardi/ds2015/data/household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

data_globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(data_globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowats)")
dev.off()