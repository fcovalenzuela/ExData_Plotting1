###Open files
household <- read.csv("I:/Coursera_Classes/Coursera_Classes/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

###Set as date variable
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household$y <- paste(as.character(household$Date),as.character(household$Time))
household$y<-strptime(household$y, "%Y-%m-%d %H:%M:%S")

####Subset between 2007-02-01 and 2007-02-02
data<-subset(household, Date== as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

###Plot 3
par(mfrow=c(1,1))
plot(data$y,as.character(data$Sub_metering_1), type="n", xlab="",ylab="Energy sub metering")
points(data$y,as.character(data$Sub_metering_1), col="black", type="l")
points(data$y,as.character(data$Sub_metering_2), col="red", type="l")
points(data$y,as.character(data$Sub_metering_3), col="blue", type="l")
legend(x="topright", col= c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.7)
dev.copy(png, file = "plot3.png")
dev.off() 
