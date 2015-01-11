# read file
mysource <- read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

# subsetting
mysubset <- mysource[mysource$Date=="1/2/2007" | mysource$Date=="2/2/2007",]
rm(mysource)

# convert date
mysubset$DateTime <- strptime(paste(mysubset$Date, mysubset$Time), format="%d/%m/%Y %H:%M:%S")


# create plots
# open device
png(filename = "plot4.png", width = 480, height = 480, units = "px") 

# set parameters
par(ps=12, mfrow = c(2, 2))

# plot 1
with(mysubset, plot(DateTime, Global_active_power, 
                type="l",
                xlab = "",
                ylab = "Global Active Power"))

# plot 2
with(mysubset, plot(DateTime, Voltage, 
                type="l",
                ylab = "Voltage"))

# plot 3
with(mysubset, plot(DateTime, Sub_metering_1, 
                type="n", 
                xlab="", 
                ylab="Energy sub metering"))
with(mysubset, lines(DateTime, Sub_metering_1, col="black"))
with(mysubset, lines(DateTime, Sub_metering_2, col="red"))
with(mysubset, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright", 
       lty = c(1,1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n" )

# plot 4
with(mysubset, plot(DateTime, Global_reactive_power, 
                type="l"))

dev.off() 

