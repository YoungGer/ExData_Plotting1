# READ DATA 
# First, you should set the working directory where the target file exists.
# Last, we get the object -- d2.
d = read.table("household_power_consumption.txt",header = TRUE,sep=';',na.strings = '?')
d1 = d
d1$Date <- strptime(d$Date,format='%d/%m/%Y')
d2 <- subset(d1,Date == '2007-02-01' | Date == '2007-02-02' )

attach(d2)
hist(Global_active_power,col='red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')
detach(d2)
dev.copy(png,filename = 'plot1.png',width = 480,height = 480)
dev.off()