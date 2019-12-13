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
png(file = "plot2.png", width = 480, height = 480)

plot(febdata$date_time, febdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()