#Assumption
#1. Script is placed at the same level as the extracted text file.

#Load the full dataset
EPC <- read.csv("household_power_consumption.txt",
                sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE, quote='\"')

#Convert date column to date
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

#Subsetting from full dataset
data <- EPC[EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02",]

#Create datetime column and convert it to datetime format
data$datetime <- paste (data$Date, data$Time)
data$datetime <- as.POSIXct(data$datetime)

#Creating plot3 (Multiple line graph)
with( data , 
      {
        plot(Sub_metering_1 ~ datetime, type = "l",
             ylab = "Energy sub metering", xlab = "",cex.lab=0.7, cex.axis=0.7)
        lines(Sub_metering_2 ~ datetime , col = "red")
        lines(Sub_metering_3 ~ datetime , col = "blue")
      })

#Adding legend to the plot
legend ("topright", col = c("black", "red", "blue"), lty = 1, cex = 0.7,
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy from screen device to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()