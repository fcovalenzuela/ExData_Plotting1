###Open files
household <- read.csv("I:/Coursera_Classes/Coursera_Classes/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

###Set as date variable
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household$y <- paste(as.character(household$Date),as.character(household$Time))
household$y<-strptime(household$y, "%Y-%m-%d %H:%M:%S")

####Subset between 2007-02-01 and 2007-02-02
data<-subset(household, Date== as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

###Plot 4
par(mfrow=c(2,2))
with(data,{
  plot(y,as.character(Global_active_power), col="black", type="l", xlab="", 
       ylab="Global Active Power")
  plot(y,as.character(Voltage), col="black", type="l", xlab="datetime", ylab="Voltage")
{plot(data$y,as.character(data$Sub_metering_1), type="n", xlab="",ylab="Energy sub metering")
 points(data$y,as.character(data$Sub_metering_1), col="black", type="l")
 points(data$y,as.character(data$Sub_metering_2), col="red", type="l")
 points(data$y,as.character(data$Sub_metering_3), col="blue", type="l")
 legend(x="topright", col= c("black","red","blue"), 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.2)}
plot(y,as.character(Global_reactive_power), col="black", type="l", xlab="datetime", 
     ylab="Global_reactive_power")
})
dev.copy(png, file = "plot4.png",width=480, height=480, res=360)
dev.off() 
