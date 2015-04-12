library(lubridate)
mydata<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";")
mydata$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
feb1<-mydata[mydata$newdate=="2007-02-01",]
feb2<-mydata[mydata$newdate=="2007-02-02",]
feb<-rbind(feb, feb2)

feb$daytime<-ymd_hms(paste(feb$newdate, feb$Time))
plot(feb$daytime, feb$Global_active_power, type="n", yaxt="n", ylab="Global Active Power (kilowatts)", xlab="",  
     ylim=c(0,6))
lines(feb$daytime, feb$Global_active_power)
axis(2, at=c(seq(from=0, to=6, by=2)))

dev.copy(png, "plot2.png")
dev.off()
