# Plot 4 Data Access ------------------------------------------------------------------


setwd("~")
setwd("./Documents/Personal Projects/Data_Science_Training/R Training/EDA_Coursera/") # set wd for GitHub Repo sync

getwd() # show working directory
list.files() # list files in working directory
library(lubridate) # load lubridate package

powerData <- read.table("./power_data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE) # create data frame
powerShort <- powerData[ powerData$Date %in% c("1/2/2007","2/2/2007"), ] # subset on specific dates

# manipulate data and change class
powerShort$Global_active_power <- as.numeric(powerShort$Global_active_power)
powerShort$fullTime <- paste(powerDataShort$Date, powerDataShort$Time)
powerShort$fullTime <- mdy_hms(powerShort$fullTime)

powerShort$fullTime <- mdy_hms(paste(powerDataShort$Date, powerDataShort$Time))
powerShort$Global_active_power <- as.numeric(powerShort$Global_active_power)
newCols <- sapply(powerShort[3:9], as.numeric) # create duplicate columns with numeric class
powerShort <- cbind(powerShort,newCols) # bind to create new df
powerShort  <- subset(powerShort, select = -c(3:9)) # delete character class variables



# Plot 4 Creation ---------------------------------------------------------


png(file = "./ExData_Plotting/plot4.png", width = 480, height = 480) #copy chart to png graphics device
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2)) # set margins of plot area
# plot 1,1 Global Active Power
plot(x = powerShort$fullTime,
     y = powerShort$Global_active_power,
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")
points(x = powerShort$fullTime,
       y = powerShort$Global_active_power,
       type = "l", col = "black")

# plot 1,2 Voltage
plot(x = powerShort$fullTime,
     y = powerShort$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# plot 2,1 Energy Submetering
plot(x = powerShort$fullTime,
     y = powerShort$Sub_metering_1,
     type = "l", xlab = "",
     ylab = "Energy sub metering")
points(x = powerShort$fullTime,
       y = powerShort$Sub_metering_2,
       type = "l", col = "red")
points(x = powerShort$fullTime,
       y = powerShort$Sub_metering_3,
       type = "l", col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), legend = colnames(powerShort[7:9]))

# plot 2,2 Global Active Power
plot(x = powerShort$fullTime,
     y = powerShort$Global_active_power,
     type = "l",
     ylab = "Global_active_power",
     xlab = "datetime")

dev.off() #close graphics device  