library(dplyr)
library(lubridate)
data <- read.table("hpc.txt",  header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")
subdata <- filter(data, dmy(Date) >= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"))
subdatadt <- mutate (subdata, 
                     dateTime=parse_date_time(paste(subdata$Date,subdata$Time), 
                                              orders="dmy_hms"))
png(file="plot3.png", 480, 480)
par( pty="s",yaxp = c(0,8,2),
     mar=c(6.1, 4.1, 4.1, 2.1)) 

plot(subdatadt$dateTime, subdatadt$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="", type="l")
lines(subdatadt$dateTime, subdatadt$Sub_metering_2,
     col="red",type="l")
lines(subdatadt$dateTime, subdatadt$Sub_metering_3,
      col="blue",type="l")
legend(x="topright", c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"),
       lty = c(1,1,1),col=c("black","red","blue"))
dev.off()