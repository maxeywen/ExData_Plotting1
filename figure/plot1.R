raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

raw$Date <-as.Date(raw$Date, "%d/%m/%Y")
data <- raw[(raw$Date == as.Date("2007-02-01")) | (raw$Date == as.Date("2007-02-02")),]
row.names(data) <- NULL

png(filename="plot1.png", width=480, height=480, units="px")
hist(data[,3], main="Global Active Power" , xlab= "Global Active Power (kilowatts)", ylab= "Frequency", col = "red" )
dev.off()