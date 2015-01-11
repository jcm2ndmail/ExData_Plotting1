# read file
mydata <- read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

# subsetting
mysubset <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

# convert date
mysubset$DateTime <- strptime(paste(mysubset$Date, mysubset$Time), format="%d/%m/%Y %H:%M:%S")

# set parameters
par(ps=12)

# create plot
with(mysubset, 
     plot(DateTime, Global_active_power, 
          type="l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)"))

# copy plot to device
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 
dev.off() 
