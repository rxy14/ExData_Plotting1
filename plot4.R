# plot4.R

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
subset_data$DateTime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), 
                                   format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power", xaxt = "n")
axis.POSIXct(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
             labels = c("Thu", "Fri", "Sat"))

# Plot 2
plot(subset_data$DateTime, subset_data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis.POSIXct(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
             labels = c("Thu", "Fri", "Sat"))

# Plot 3
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
axis.POSIXct(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
             labels = c("Thu", "Fri", "Sat"))
legend("topright", bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Plot 4
plot(subset_data$DateTime, subset_data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis.POSIXct(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), 
             labels = c("Thu", "Fri", "Sat"))

dev.off()