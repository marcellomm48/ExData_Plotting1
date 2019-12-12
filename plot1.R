#plots plot 1

#read file

data <- read.table("C:/Users/molinarm/Desktop/Coursera/Course 4- Exploratory/Week 1/household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE) 
                   #,nrows = 100 )

time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data[time > "2007-02-01" & time < "2007-02-03",]



#can i be more efficient with this? Filter first? or mutate/transform the data.frame and then filter? Yes! Filter!!