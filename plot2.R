##Import and prepare data
data <- read.table("D:/csra/IN_PROGRESS/Exploratory Analysis/assign1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
d_feb <- subset(data, data$Date <= as.Date("2007-02-02") & data$Date >= as.Date("2007-02-01"))
##Convert datatype for variables from factor to numeric
d_feb$Global_active_power <- as.numeric(as.character(d_feb$Global_active_power))
d_feb$Global_reactive_power <- as.numeric(as.character(d_feb$Global_reactive_power))
d_feb$Voltage <- as.numeric(as.character(d_feb$Voltage))
d_feb$Global_intensity <- as.numeric(as.character(d_feb$Global_intensity))
d_feb$Sub_metering_1 <- as.numeric(as.character(d_feb$Sub_metering_1))
d_feb$Sub_metering_2 <- as.numeric(as.character(d_feb$Sub_metering_2))
d_feb$Sub_metering_3 <- as.numeric(as.character(d_feb$Sub_metering_3))

##Plot graph 2
png(file = "D:/csra/IN_PROGRESS/Exploratory Analysis/assign1/plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent",  res = NA)
par(mfrow=c(1,1))
plot(d_feb$Time,d_feb$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)", main="")
dev.off()
