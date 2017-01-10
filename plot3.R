# working directory must be set to location of household_power_consumption.txt
# The meter data file is not included in the results.
# The device must be the graphics device for this code to function correctly.
library(dplyr)
meter_data_4y <- read.table(file="household_power_consumption.txt", header=TRUE, dec=".", sep=";", numerals=c("warn.loss"), stringsAsFactors = FALSE)
days2_in_feb <- filter(meter_data_4y, Date=="1/2/2007" | Date=="2/2/2007")
days2_in_feb$DateTime <- strptime(paste(days2_in_feb$Date, days2_in_feb$Time), "%d/%m/%Y %H:%M:%S") 
days2_in_feb$Sub_metering_1 <- as.numeric(days2_in_feb$Sub_metering_1)
days2_in_feb$Sub_metering_2 <- as.numeric(days2_in_feb$Sub_metering_2)
days2_in_feb$Sub_metering_3 <- as.numeric(days2_in_feb$Sub_metering_3)

plot.window(xlim=c(0,3),ylim=c(0,40),asp="480/480")
plot.new()

plot(x=days2_in_feb$DateTime,y=days2_in_feb$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n", col="black")
axis(2, at = c(0,10,20,30),labels=(c(0,10,20,30)))

lines(days2_in_feb$DateTime, days2_in_feb$Sub_metering_1, col="black", type="l")
lines(days2_in_feb$DateTime, days2_in_feb$Sub_metering_2, col="red", type="l")
lines(days2_in_feb$DateTime, days2_in_feb$Sub_metering_3, col="blue", type="l")
legend("topcenter", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
dev.copy(png, file ="plot3.png")
dev.off()

