data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dat$Global_active_power <- as.numeric(dat$Global_active_power)

dat$datetime <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(dat$datetime, dat$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()