###Open files
household <- read.csv("I:/Coursera_Classes/Coursera_Classes/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

###Set as date variable
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household$y <- paste(as.character(household$Date),as.character(household$Time))
household$y<-strptime(household$y, "%Y-%m-%d %H:%M:%S")

####Subset between 2007-02-01 and 2007-02-02
data<-subset(household, Date== as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

###Plot 1
par(mfrow=c(1,1))
plot01<-hist(as.numeric(as.character(data$Global_active_power)), col= "red", 
             main="Global Active Power",xlab= "Global Active Power (Kilowatts)",
             ylab = "Global Active Power (Kilowatts)")
dev.copy(png, file = "plot1.png",width=480, height=480, res=120)
dev.off() 
