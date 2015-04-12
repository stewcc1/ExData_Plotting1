library(lubridate)
mydata<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";")
mydata$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
feb1<-mydata[mydata$newdate=="2007-02-01",]
feb2<-mydata[mydata$newdate=="2007-02-02",]
feb<-rbind(feb1, feb2)
feb$newtime<-strptime(feb$Time, "%H:%M:%S")

hist(feb$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", xlim=c(0,6),axes=F)
axis(2)
axis(1, at=c(seq(from=0, to=6, by=2)))
dev.copy(png, "plot1.png")
dev.off()