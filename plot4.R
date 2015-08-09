# Read in the data.
data <- read.csv2("pc.txt", dec = ".", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub1", "Sub2", "Sub3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?", nrows = 2880, skip = 66636)

# Convert the date parameters
dummy <- paste(data$Date, data$Time)
dates <- strptime(dummy, "%d/%m/%Y %H:%M:%S")

# Start output
png(file = "plot4.png")
par(mfrow = c(2,2))

# First plot
plot(dates, data$Global_active_power, type = "l", ylab = "Global active power", xlab = "", bg = "white")

# Second plot
plot(dates, data$Voltage, type = "l", ylab = "Voltage")

# Third plot
plot(dates, data$Sub1, type = "l", ylab = "Energy sub metering", xlab = "", bg = "white")
lines(dates, data$Sub2, col = "red")
lines(dates, data$Sub3, col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub1", "Sub2", "Sub3"))

# Fourth plot
plot(dates, data$Global_reactive_power, type = "l", ylab = "Global reactive power")

# Close the graphic device
dev.off()
