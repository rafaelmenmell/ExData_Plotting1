rm(list=ls())
#read all data
consum<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
#subset dates
consum$Date<-as.Date(consum$Date,format="%d/%m/%Y")
consum<-consum[consum$Date==as.Date("2007-02-01") | consum$Date==as.Date("2007-02-02"),]
#plot1
png("plot1.png",height = 480,width = 480)
hist(consum$Global_active_power,col="red",main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")
dev.off()
