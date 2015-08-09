# Read in the data
data <- read.csv2("pc.txt", dec = ".", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub1", "Sub2", "Sub3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?", nrows = 2880, skip = 66636)

# Convert the date parameters
dummy <- paste(data$Date, data$Time)
dates <- strptime(dummy, "%d/%m/%Y %H:%M:%S")

# Plot the data
hist(data$Global_active_power, xlab = "Global active power (kilowatts)", main = "Global active power", col = "orange", bg = "white")

# Get the PNG copy
dev.copy(png, file = "plot1.png")
dev.off()
