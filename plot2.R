### Reading Data
datapower <- read.csv.sql("./household_power_consumption.txt", sep = ";",
                          sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

### Convert Date as.Date
datapower$Date <- as.Date(datapower$Date,format="%d/%m/%Y")
dt <- paste(as.Date(datapower$Date),datapower$Time)
datapower$datetime <- as.POSIXct(dt)

### Plot number 02
with(datapower, {
    plot(Global_active_power~datetime,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
})
