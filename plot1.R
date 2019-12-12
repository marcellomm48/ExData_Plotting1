#plots plot 1


library(dplyr)
library(lubridate)
#read file

data <- read.table("C:/Users/molinarm/Desktop/Coursera/Course 4- Exploratory/Week 1/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   stringsAsFactors = FALSE
                   ) 
                   #,nrows = 100 )

#this doesn't work, giveserror(Column `date_time` is of 
#unsupported class POSIXlt; please use POSIXct instead)
#but I like the look of this more!
mutate(data, date_time = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
febdays <- filter(data, date_time > "2007-02-01" & date_time < "2007-02-03")

#gets rid of time data
data1 <- mutate(data, date_time = as.Date(paste(data$Date, data$Time), "%d/%m/%Y"))
febdays <- filter(data1, date_time > "2007-02-01" & date_time < "2007-02-03")


#this works
#time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
#data[time > "2007-02-01" & time < "2007-02-03",]

febdays$Global_active_power <- as.numeric(febdays$Global_active_power)

hist(febdays$Global_active_power, col = "Red")

with(febdays, plot(date_time, Global_active_power))