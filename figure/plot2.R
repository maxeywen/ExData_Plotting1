raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

raw$Date <-as.Date(raw$Date, "%d/%m/%Y")
data <- raw[(raw$Date == as.Date("2007-02-01")) | (raw$Date == as.Date("2007-02-02")),]
row.names(data) <- NULL

t <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480, units="px")
plot(t, data[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(t,data[,3])
dev.off()