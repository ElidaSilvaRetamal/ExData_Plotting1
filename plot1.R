### Reading Data
datapower <- read.csv.sql("./household_power_consumption.txt", sep = ";",
                          sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

### Plot number 01
hist(datapower$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab =" Frenquency", 
     col = "red")
