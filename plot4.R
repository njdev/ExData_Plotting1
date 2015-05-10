library(dplyr)
library(lubridate)
data <- read.table("hpc.txt",  header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")
subdata <- filter(data, dmy(Date) >= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"))
subdatadt <- mutate (subdata, 
                     dateTime=parse_date_time(paste(subdata$Date,subdata$Time), 
                                              orders="dmy_hms"))
png(file="plot4.png", 480, 480)
par(mfrow=c(2,2)) 

plot(subdatadt$dateTime, subdatadt$Global_active_power,
     ylab="Global Active Power",
     xlab="", type="n")
lines(subdatadt$dateTime, subdatadt$Global_active_power,
      type="l")

plot(subdatadt$dateTime, subdatadt$Voltage,
     ylab="Voltage",
     xlab="datetime", type="n")
lines(subdatadt$dateTime, subdatadt$Voltage,
      type="l")


plot(subdatadt$dateTime, subdatadt$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="", type="l")
lines(subdatadt$dateTime, subdatadt$Sub_metering_2,
      col="red",type="l")
lines(subdatadt$dateTime, subdatadt$Sub_metering_3,
      col="blue",type="l")
legend(x="topright", c("Sub_metering_1","Sub_metering_2",
            "Sub_metering_3"),bty = "n",
       lty = c(1,1,1),col=c("black","red","blue"))


plot(subdatadt$dateTime, subdatadt$Global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datetime", type="n")
lines(subdatadt$dateTime, subdatadt$Global_reactive_power,
      type="l")

dev.off()