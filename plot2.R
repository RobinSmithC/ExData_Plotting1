# working directory must be set to location of household_power_consumption.txt
# The meter data file is not included in the results.
# The device must be the graphics device for this code to function correctly.
library(dplyr)
meter_data_4y <- read.table(file="household_power_consumption.txt", header=TRUE, dec=".", sep=";", numerals=c("warn.loss"), as.is = T)
days2_in_feb <- filter(meter_data_4y, Date=="1/2/2007" | Date=="2/2/2007")
days2_in_feb$DateTime <- strptime(paste(days2_in_feb$Date, days2_in_feb$Time), "%d/%m/%Y %H:%M:%S") 
days2_in_feb$Global_active_power <- as.double(days2_in_feb$Global_active_power)

plot.window(xlim=c(0,3),ylim=c(0,40),asp="480/480")
plot.new()

plot(x=days2_in_feb$DateTime,y=days2_in_feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file ="plot2.png")
dev.off()
