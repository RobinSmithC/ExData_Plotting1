# working directory must be set to location of household_power_consumption.txt
# The meter data file is not included in the results.
# The device must be the graphics device for this code to function correctly.
library(dplyr)

meter_data_4y <- read.table(file="household_power_consumption.txt", header=TRUE, dec=".", sep=";", numerals=c("warn.loss"))
days2_in_feb <- filter(meter_data_4y, Date=="1/2/2007" | Date=="2/2/2007")
x <- as.numeric(days2_in_feb$Global_active_power)

hist(x, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", asp="480/480")

dev.copy(png, file ="plot1.png")
dev.off()
