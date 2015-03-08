# Assumption
# 1. Script is place at the same level as the extracted text file.

#Load the full dataset
EPC <- read.csv("household_power_consumption.txt",
                sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE, quote='\"')

#Convert date column to date
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

#Subset from the full dataset
data <- EPC[EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02",]

#Creating plot1 (histogram)
hist(data$Global_active_power, col="red", 
     main = "Global Active Power" ,cex.main=0.9,
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)", 
     cex.lab=0.7, cex.axis=0.7, ylim=c(0,1200))

#Copy the graph from screen device to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
