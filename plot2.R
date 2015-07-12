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
y<-Both$Global_active_power
ylabel="Global Active Power (kilowatts)"
par(mar=c(2,4,1,1))
png("plot2.png")
plot(x,y,type="l",ylab=ylabel,xlab="")
dev.off()
