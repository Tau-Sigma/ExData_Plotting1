setwd("/home/sascha/Dokumente/Coursera/Exploratory data analysis/Week 1")
energyraw<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
Day1<-energyraw[energyraw$Date=="1/2/2007",]
Day2<-energyraw[energyraw$Date=="2/2/2007",]
Both = rbind(Day1,Day2)
Both$Global_active_power = as.numeric(Both$Global_active_power)
cols <- c('Date','Time')	#Define the columns
Both$DateTime <- apply(Both[,cols],1,paste,collapse=" ") #add new column with combined values
Both$DateTimeConv <- strptime(Both$DateTime, format='%d/%m/%Y %H:%M:%S') #transform date timey
x<-Both$DateTimeConv
Sub_metering_1<-Both$Sub_metering_1
Sub_metering_2<-Both$Sub_metering_2
Sub_metering_3<-Both$Sub_metering_3
ylabel="Energy submetering"
par(mar=c(2,4,1,1))
png("plot3.png")
plot(x,Sub_metering_1,type="l",ylab=ylabel,xlab="")
lines(x,Sub_metering_2,col="red")
lines(x,Sub_metering_3,col="blue")
legend("topright", col = c("black", "red","blue"), legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5))
dev.off()
