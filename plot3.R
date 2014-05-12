##read in data
electricPowerConsumptionData = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

##subset data from 1/2/2007 and 2/2/2007
electricPowerConsumptionDataIn2007Feb <- subset(electricPowerConsumptionData, (Date %in% c("1/2/2007","2/2/2007")))

##transform the data from factor to string,numbers and date
electricPowerConsumptionDataIn2007Feb <- transform(electricPowerConsumptionDataIn2007Feb,Date=as.character(Date),Time=as.character(Time),Global_active_power = as.numeric(Global_active_power),Global_reactive_power=as.numeric(Global_active_power),Voltage = as.numeric(Voltage),Global_intensity=as.numeric(Global_intensity),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3))
electricPowerConsumptionDataIn2007Feb$DateAndTime <- paste(electricPowerConsumptionDataIn2007Feb$Date,electricPowerConsumptionDataIn2007Feb$Time,sep=" ")
electricPowerConsumptionDataIn2007Feb$DateAndTime = strptime(electricPowerConsumptionDataIn2007Feb$DateAndTime,format="%d/%m/%Y %H:%M:%S")

##open png device
png(file="plot3.png")

##plot scatterplot

plot(electricPowerConsumptionDataIn2007Feb$DateAndTime,electricPowerConsumptionDataIn2007Feb$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(electricPowerConsumptionDataIn2007Feb$DateAndTime,electricPowerConsumptionDataIn2007Feb$Sub_metering_2,col="red")
lines(electricPowerConsumptionDataIn2007Feb$DateAndTime,electricPowerConsumptionDataIn2007Feb$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),lty=c(1,1,1),col=c("black","red","blue")) 

##close png device and save file
dev.off()