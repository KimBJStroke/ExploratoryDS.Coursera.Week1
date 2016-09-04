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


### Plot 2
DateTime <- strptime(paste(AnalysisData$Date, AnalysisData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric (AnalysisData$Global_active_power)
png ("plot2.png", width = 480, height = 480)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

