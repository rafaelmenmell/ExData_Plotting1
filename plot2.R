rm(list=ls())
#read all data
consum<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
#subset dates
consum$Date<-as.Date(consum$Date,format="%d/%m/%Y")
consum<-consum[consum$Date==as.Date("2007-02-01") | consum$Date==as.Date("2007-02-02"),]

consum$datetime<-as.POSIXct(paste(as.character(consum$Date),consum$Time,sep=" "))

#plot2
png("plot2.png",height = 480,width = 480)
plot(consum[,c("datetime","Global_active_power")],type="l",ylab="Global Active Power",xlab="")
dev.off()
