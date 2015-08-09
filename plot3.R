# Plot 3 Data Access ------------------------------------------------------------------
# Load Packages -----------------------------------------------------------
library(lubridate) # load lubridate; eaiser to work with dates
library(dplyr) # easier to select and filter data

# Access Data -------------------------------------------------------------
# set wd for GitHub Repo sync
setwd("./Documents/Personal Projects/Data_Science_Training/R Training/EDA_Coursera/") 
# unzip into working directory; create "PowerData" as target directory
unzip("../../../../../LocalData/exdata-data-household_power_consumption.zip", exdir = "PowerData")
# check files in unzipped directory
list.files("./PowerData/")

# read 1000 rows of data to see structure
powerDataShort <- read.table("./PowerData/household_power_consumption.txt",
                             header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows = 1000, blank.lines.skip = TRUE)

# check structure of data frame
str(powerDataShort)

# read all rows to create data frame
powerData <- read.table("./PowerData/household_power_consumption.txt", 
                             header = TRUE, sep = ";", stringsAsFactors = FALSE)


# subset data frame
powerData <- powerData%>% 
        filter(Date %in% c("1/2/2007","2/2/2007"))

# check structure of data frame
str(powerData)

# Convert to Correct Class ------------------------------------------------
# change class
powerData[,c(1:2)] <- sapply(powerData[,c(1,2)], as.character) # change class to character
powerData[,c(3:9)] <- sapply(powerData[,c(3:9)], as.numeric) # change class to numeric
powerData$fullTime <- dmy_hms(paste(powerData$Date, powerData$Time)) # create full time variable POSIXct class
# Plot 3 Creation ---------------------------------------------------------


png("./ExData_Plotting/plot3.png", width=480, height=480)# set dimensions of plot
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
legend("topright", lty = 1, col = c("black","red", "blue"), legend = colnames(powerShort[7:9]))
dev.off()
dev.off()