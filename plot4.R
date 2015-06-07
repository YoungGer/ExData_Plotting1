# First, you should set the working directory where the target file exists.
# Last, we get the object -- d2.
d = read.table("household_power_consumption.txt",header = TRUE,sep=';',na.strings = '?')
d1 = d
d1$allTime = paste(d1$Date,d1$Time)
d2 <- subset(d1,Date == '1/2/2007' | Date == '2/2/2007' )
d2$allTime = strptime(d2$allTime,format='%d/%m/%Y %H:%M:%S')

old_par = par()
par(mfrow=c(2,2))
attach(d2)
#plot1
plot(allTime,Global_active_power,main='',xlab='',ylab='Global Active Power (kilowatts)',type ='l' )
#plot2
plot(allTime,Voltage,main='',xlab='datetime',ylab='Voltage',type ='l' )
#plot3
plot(allTime,Sub_metering_1,main='',xlab='',ylab='Energy sub metering',type ='l' )
lines(allTime,Sub_metering_2,main='',xlab='',ylab='Energy sub metering',type ='l',col='red')
lines(allTime,Sub_metering_3,main='',xlab='',ylab='Energy sub metering',type ='l',col='blue')
#legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col = c('black','red','blue'),lty = 1)
#plot4
plot(allTime,Global_reactive_power,main='',xlab='',ylab='Global Active Power (kilowatts)',type ='l' )
detach(d2)
par(old_par)

dev.copy(png,filename = 'plot4.png',width = 480,height = 480)
dev.off()