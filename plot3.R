# Read in the data
data <- read.csv2("pc.txt", dec = ".", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub1", "Sub2", "Sub3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?", nrows = 2880, skip = 66636)

# Convert the date parameters
dummy <- paste(data$Date, data$Time)
dates <- strptime(dummy, "%d/%m/%Y %H:%M:%S")

# Plot the data
plot(dates, data$Sub1, type = "l", ylab = "Energy sub metering", xlab = "", bg = "white")
lines(dates, data$Sub2, col = "red")
lines(dates, data$Sub3, col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub1", "Sub2", "Sub3"))

# Get the PNG copy
dev.copy(png, file = "plot3.png")
dev.off()
