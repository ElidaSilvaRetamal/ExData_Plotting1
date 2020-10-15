### Reading Data
datapower <- read.csv.sql("./household_power_consumption.txt", sep = ";",
                          sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

### Convert Date as.Date
datapower$Date <- as.Date(datapower$Date,format="%d/%m/%Y")
dt <- paste(as.Date(datapower$Date),datapower$Time)
datapower$datetime <- as.POSIXct(dt)

### Plot number 02
png("plot2.png",width  = 480,height = 480)

with(datapower, {
    plot(Global_active_power~datetime,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

