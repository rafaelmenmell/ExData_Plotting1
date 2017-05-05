rm(list=ls())
#read all data
consum<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
#subset dates
consum$Date<-as.Date(consum$Date,format="%d/%m/%Y")
consum<-consum[consum$Date==as.Date("2007-02-01") | consum$Date==as.Date("2007-02-02"),]

consum$datetime<-as.POSIXct(paste(as.character(consum$Date),consum$Time,sep=" "))

#plot4
png("plot4.png",height = 480,width = 480)
par("mfrow"=c(2,2))
#subplot1
plot(consum[,c("datetime","Global_active_power")],type="l",ylab="Global Active Power",xlab="")
#subplot2
plot(consum[,c("datetime","Voltage")],type="l",ylab="Voltage")
#subplot3
plot(consum[,c("datetime","Sub_metering_1")],type="n",xlab="",ylab="Energy sub metering")
lines(consum$datetime,consum$Sub_metering_1,type="l",col="black")
lines(consum$datetime,consum$Sub_metering_2,type="l",col="red")
lines(consum$datetime,consum$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
#subplot4
plot(consum[,c("datetime","Global_reactive_power")],type="l")
dev.off()