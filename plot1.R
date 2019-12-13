#plots plot 1


library(dplyr)
library(lubridate)
#read file

data <- read.table("C:/Users/molinarm/Desktop/Coursera/Course 4- Exploratory/Week 1/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   stringsAsFactors = TRUE,
                   na.strings = "?")
                   #,nrows = 100 )

#subset data first
febdata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-02",]

date_time <- strptime(paste(febdata$Date, febdata$Time), "%d/%m/%Y %H:%M:%S")

febdata <- cbind(febdata, date_time)

#sucess! plots #1
hist(febdata$Global_active_power, col = "Red")

#sucess #2!
plot(as.POSIXct(febdata$date_time), febdata$Global_active_power, type = "l")



-----------------------------------

#this works
        #whole list of date/times POSIXlt
date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        
        #list of true/false for feb days
febdate_time <- date_time >= "2007-02-01" & date_time < "2007-02-03"

febdata <- cbind(data[febdate_time, ], date_time = date_time[febdate_time])

#not needed after strings as factors = TRUE
#febdata$Global_active_power <- as.numeric(febdata$Global_active_power)

#sucess! plots
hist(febdata$Global_active_power, col = "Red")

#sucess #2!
plot(as.POSIXct(febdata$date_time), febdata$Global_active_power, type = "l")


#maybe later
with(febdata, plot(time, Global_active_power, type = "l"))
with(febdata, geom_line(date_time, Global_active_power))


#this doesn't work, giveserror(Column `date_time` is of 
#unsupported class POSIXlt; please use POSIXct instead)
#but I like the look of this more!
mutate(data, date_time = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
febdays <- filter(data, date_time > "2007-02-01" & date_time < "2007-02-03")

#as.Date() gets rid of time data, as.POSIXct doesn't, but also doesn't work...
data1 <- mutate(data, date_time = as.Date(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
data1 <- mutate(data, date_time = as.POSIXct(paste(data$Date, data$Time)))
febdays <- filter(data1, date_time > "2007-02-01" & date_time < "2007-02-03")