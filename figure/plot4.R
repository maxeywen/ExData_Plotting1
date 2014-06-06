raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

raw$Date <-as.Date(raw$Date, "%d/%m/%Y")
data <- raw[(raw$Date == as.Date("2007-02-01")) | (raw$Date == as.Date("2007-02-02")),]
row.names(data) <- NULL

t <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2))
plot(t, data[,3], type="n", xlab="", ylab="Global Active Power")
lines(t,data[,3])

plot(t, data[,5], type="n", xlab = "datetime", ylab="Voltage")
lines(t,data[,5])

plot(t, data[,7], type="n", xlab="", ylab="Energy sub metering")
lines(t,data[,7], col="black")
lines(t,data[,8], col="red")
lines(t,data[,9], col="blue")
legend("topright", lty=1, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(t, data[,4], type="n", xlab = "datetime", ylab="Global_reactive_power")
lines(t,data[,4])
dev.off()