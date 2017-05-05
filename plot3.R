rm(list=ls())
#read all data
consum<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
#subset dates
consum$Date<-as.Date(consum$Date,format="%d/%m/%Y")
consum<-consum[consum$Date==as.Date("2007-02-01") | consum$Date==as.Date("2007-02-02"),]

consum$datetime<-as.POSIXct(paste(as.character(consum$Date),consum$Time,sep=" "))

#plot3
png("plot3.png",height = 480,width = 480)
plot(consum[,c("datetime","Sub_metering_1")],type="n",xlab="",ylab="Energy sub metering")
lines(consum$datetime,consum$Sub_metering_1,type="l",col="black")
lines(consum$datetime,consum$Sub_metering_2,type="l",col="red")
lines(consum$datetime,consum$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
