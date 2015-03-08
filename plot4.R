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

# Setting the number of graph and margin
par(mfcol = c(2,2),mar=c(4,4,4,2))

# Creating plot4 (Multiplots graph)
with (data , {
  plot(Global_active_power ~ datetime, type = 'l',
  ylab = "Global Active Power", xlab = "", cex.lab = 0.8, cex.axis=0.8)
  plot(Sub_metering_1 ~ datetime, type = "l",
       ylab = "Energy sub metering", xlab = "", cex.lab = 0.8, cex.axis=0.8)
  lines(Sub_metering_2 ~ datetime , col = "red")
  lines(Sub_metering_3 ~ datetime , col = "blue")
  legend ("topright", col = c("black", "red", "blue"), lty = 1,bty = "n",cex=0.5,
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Voltage ~ datetime , type = 'l', cex.lab = 0.8, cex.axis=0.8)
  plot(Global_reactive_power ~ datetime, type = 'l', cex.lab = 0.8, cex.axis=0.8)
  })

#Copy from screen device to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
