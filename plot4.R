data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dat$Global_active_power <- as.numeric(dat$Global_active_power)

dat$datetime <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

dat$subMetering1 <- as.numeric(dat$Sub_metering_1)
dat$subMetering2 <- as.numeric(dat$Sub_metering_2)
dat$subMetering3 <- as.numeric(dat$Sub_metering_3)

dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$Voltage <- as.numeric(dat$Voltage)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(dat$datetime, dat$Global_reactive_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dat$datetime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dat$datetime, dat$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dat$datetime, dat$subMetering2, type="l", col="red")
lines(dat$datetime, dat$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dat$datetime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()