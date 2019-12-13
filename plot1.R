#plots plot 1

#read file
data <- read.table("C:/Users/molinarm/Desktop/Coursera/Course 4- Exploratory/Week 1/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   stringsAsFactors = TRUE,
                   na.strings = "?")
                   #,nrows = 100 )

#subset data first, then filter for feb 1 and 2
febdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]

date_time <- strptime(paste(febdata$Date, febdata$Time), "%d/%m/%Y %H:%M:%S")

febdata <- cbind(febdata, date_time)
febdata$date_time <- as.POSIXct(febdata$date_time)

#set chart to a square
par(mfrow = c(1,1), pty = "s")

# plots chart to PNG
png(file = "plot1.png")

hist(febdata$Global_active_power, 
     col = "Red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "GLobal Active Power")

dev.off()