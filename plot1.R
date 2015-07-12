setwd("/home/sascha/Dokumente/Coursera/Exploratory data analysis/Week 1")
energyraw<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
Day1<-energyraw[energyraw$Date=="2/2/2007",]
Day2<-energyraw[energyraw$Date=="1/2/2007",]
Both = rbind(Day1,Day2)
Both$Global_active_power = as.numeric(Both$Global_active_power)
xlabel="Global Active Power (kilowatts)"
ylabel="Frequency"
mainlabel="Global Active Power"
par(mar=c(4,1,1,0))
png("plot1.png")
hist(Both[,"Global_active_power"],col="red", main=mainlabel, xlab=xlabel,ylab=ylabel,cex.lab=0.75)
dev.off()