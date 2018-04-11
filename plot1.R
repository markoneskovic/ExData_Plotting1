data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dat$Global_active_power <- as.numeric(dat$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(dat$Global_active_power,
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()