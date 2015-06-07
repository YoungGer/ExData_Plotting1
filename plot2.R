# READ DATA 
# First, you should set the working directory where the target file exists.
# Last, we get the object -- d2.
d = read.table("household_power_consumption.txt",header = TRUE,sep=';',na.strings = '?')
d1 = d
d1$allTime = paste(d1$Date,d1$Time)
d2 <- subset(d1,Date == '1/2/2007' | Date == '2/2/2007' )
d2$allTime = strptime(d2$allTime,format='%d/%m/%Y %H:%M:%S')

attach(d2)
plot(allTime,Global_active_power,main='',xlab='',ylab='Global Active Power (kilowatts)',type ='l' )
detach(d2)
dev.copy(png,filename = 'plot2.png',width = 480,height = 480)
dev.off()