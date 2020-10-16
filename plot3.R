### Reading Data
datapower <- read.csv.sql("./household_power_consumption.txt", sep = ";",
                          sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

### Convert Date as.Date
datapower$Date <- as.Date(datapower$Date,format="%d/%m/%Y")
dt <- paste(as.Date(datapower$Date),datapower$Time)
datapower$datetime <- as.POSIXct(dt)

### Plot number 03
with(datapower, {
    plot(Sub_metering_1~datetime,type="l",
         xlab="",
         ylab="Energy sub metering")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
})

legend("topright",
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,
       lwd=2,
       pt.cex = cex)
