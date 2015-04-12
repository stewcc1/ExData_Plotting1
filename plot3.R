library(lubridate)
mydata<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";")
mydata$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
feb1<-mydata[mydata$newdate=="2007-02-01",]
feb2<-mydata[mydata$newdate=="2007-02-02",]
feb<-rbind(feb, feb2)
feb$daytime<-ymd_hms(paste(feb$newdate, feb$Time))

plot(feb$daytime, feb$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(feb$daytime, feb$Sub_metering_1)
lines(feb$daytime, feb$Sub_metering_2, col="red")
lines(feb$daytime, feb$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","blue","red"))
dev.copy(png, "plot3.png")
dev.off()