install.packages("readtext")
library(readtext)
readtext("~/Course Trainings/John Hopkins Data Science Boot Camp/JHU Working Directory/household_power_consumption.txt")
powerConsumption = read.table("household_power_consumption.txt")
library(data.table)
file_power <- fread("household_power_consumption.txt", na.strings = "?")
## set time variable
power_Household <- file_power[file_power$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
power_Household <- cbind(SetTime, finalData)

## Plot 1: Global Active Power
png(filename = "plot1")
hist(power_Household$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

## Plot 2: 
plot(power_Household$SetTime, power_Household$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

## Plot 3
par(mar = c(5, 4, 1, 1))
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(power_Household$SetTime, power_Household$Sub_metering_1, type = "l", col = columnlines[1], xlab = "", ylab = "Energy Sub Metering")
lines(power_Household$SetTime, power_Household$Sub_metering_2, col=columnlines[2])
lines(power_Household$SetTime, power_Household$Sub_metering_3, col=columnlines[3])
legend("topright", legend = labels, col=columnlines, lty = "solid")

## Plot 4
par(mar = c(3, 2, 1, 1), mfrow = c(2, 2))
plot(power_Household$SetTime, power_Household$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
plot(power_Household$SetTime, power_Household$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(power_Household$SetTime, power_Household$Sub_metering_1, type = "l", col = columnlines[1], xlab = "", ylab = "Energy Sub Metering")
lines(power_Household$SetTime, power_Household$Sub_metering_2, col=columnlines[2])
lines(power_Household$SetTime, power_Household$Sub_metering_3, col=columnlines[3])
legend("topright", legend = labels, col=columnlines, lty = "solid")
plot(power_Household$SetTime, power_Household$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")






































file_power[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
library(dplyr)
power_Household <- filter(file_power, DateTime >= as.Date("2007-02-01"), DateTime < as.Date("2007-02-02"))