# read file
mysource <- read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

# subsetting
mysubset <- mysource[mysource$Date=="1/2/2007" | mysource$Date=="2/2/2007",]

# converting to numeric
mysubset$Global_active_power <- as.numeric(mysubset$Global_active_power)

# set parameters
par(ps=12)

# create plot
hist(mysubset$Global_active_power, 
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# copy plot to device
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") 
dev.off()  