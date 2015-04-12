library(lubridate)
mydata<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";")
mydata$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
feb1<-mydata[mydata$newdate=="2007-02-01",]
feb2<-mydata[mydata$newdate=="2007-02-02",]
feb<-rbind(feb, feb2)
feb$daytime<-ymd_hms(paste(feb$newdate, feb$Time))

png("plot4.png")
par(mfrow=c(2,2))
#first plot
plot(feb$daytime, feb$Global_active_power, type="n", yaxt="n", ylab="Global Active Power (kilowatts)", xlab="",  
     ylim=c(0,6))
lines(feb$daytime, feb$Global_active_power)
axis(2, at=c(seq(from=0, to=6, by=2)))

#second plot
plot(feb$daytime, feb$Voltage, type="n", xlab="datetime", ylab="Voltage")
 lines(feb$daytime, feb$Voltage)

#third plot
plot(feb$daytime, feb$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(feb$daytime, feb$Sub_metering_1)
lines(feb$daytime, feb$Sub_metering_2, col="red")
lines(feb$daytime, feb$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","blue","red"))

#fourth plot
plot(feb$daytime, feb$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(feb$daytime, feb$Global_reactive_power)
dev.off()