### Reading Data
datapower <- read.csv.sql("./household_power_consumption.txt", sep = ";",
                          sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")


### Convert Date as.Date
datapower$Date <- as.Date(datapower$Date,format="%d/%m/%Y")
dt <- paste(as.Date(datapower$Date),datapower$Time)
datapower$datetime <- as.POSIXct(dt)

### Plot number 04
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(datapower, {
    plot(Global_active_power~datetime, type="l", 
         ylab="Global Active Power", xlab="")
    
    plot(Voltage~datetime, type="l", 
         ylab="Voltage (volt)", xlab="datatime")
    
    plot(Sub_metering_1~datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    
    lines(Sub_metering_2~datetime,col='Red')
    
    lines(Sub_metering_3~datetime,col='Blue')
    
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Global_reactive_power~datetime, type="l", 
         ylab="Global_rective_power",xlab="datatime")
})
