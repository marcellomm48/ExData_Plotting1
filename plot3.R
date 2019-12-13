data <- read.table("C:/Users/molinarm/Desktop/Coursera/Course 4- Exploratory/Week 1/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   stringsAsFactors = TRUE,
                   na.strings = "?")

#subset data first
febdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]

date_time <- strptime(paste(febdata$Date, febdata$Time), "%d/%m/%Y %H:%M:%S")

febdata <- cbind(febdata, date_time)

febdata$date_time <- as.POSIXct(febdata$date_time)

#set chart to a square
par(mfrow = c(1,1), pty = "s")

# plots chart to PNG
png(file = "plot3.png")

with(febdata, plot(date_time, Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = ""))
with(febdata, lines(date_time, Sub_metering_2, col = "red"))
with(febdata, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(1,1), col = c("black", "red", "blue"))

dev.off()