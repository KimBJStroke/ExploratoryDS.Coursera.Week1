######################################
#### Data Science Specialization from Coursera
#### Step 4: Exploratory Data Analyses
######################################

## Week 1: Peer Review Assignment

### This assignment uses data from the UC Irvine Machine Learning Repository, 
### a popular repository for machine learning datasets. 
### In particular, we will be using the “Individual household electric power consumption Data Set” 
### which I have made available on the course web site:

### Dataset: Electric power consumption [20Mb]
### Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. 
### Different electrical quantities and some sub-metering values are available.


getwd()
setwd("~/Documents/STUDY/Data Science/Coursera - DS specialization/Exploratory analysis")

# Load in necessary libraries
library (dplyr)
library (data.table)

# Read in the URL of the assigned file and unzip
filename <- "Fhousehold_power_consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
head(data)
AnalysisData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
head (AnalysisData)



### Plot 4
DateTime <- strptime(paste(AnalysisData$Date, AnalysisData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric (AnalysisData$Global_active_power)
subMetering1 <- as.numeric(AnalysisData$Sub_metering_1)
subMetering2 <- as.numeric(AnalysisData$Sub_metering_2)
subMetering3 <- as.numeric(AnalysisData$Sub_metering_3)
GlobalReactivePower <- as.numeric(AnalysisData$Global_reactive_power)
Voltage <- as.numeric(AnalysisData$Voltage)



png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, subMetering2, type="l", col="red")
lines(DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

