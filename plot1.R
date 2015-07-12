# Plot 1 Data Access ------------------------------------------------------------------


setwd("~")
setwd("./Documents/Personal Projects/Data_Science_Training/R Training/EDA_Coursera/") # set wd for GitHub Repo sync

getwd() # show working directory
list.files() # list files in working directory
library(lubridate) # load lubridate package

powerData <- read.table("./power_data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE) # create data frame
powerShort <- powerData[ powerData$Date %in% c("1/2/2007","2/2/2007"), ] # subset on specific dates

powerShort$Global_active_power <- as.numeric(powerShort$Global_active_power)
powerShort$fullTime <- paste(powerDataShort$Date, powerDataShort$Time)
powerShort$fullTime <- mdy_hms(powerShort$fullTime)


# Plot 1 Creation ---------------------------------------------------------


png("./ExData_Plotting/plot1.png", width=480, height=480)
hist(x = powerShort$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()