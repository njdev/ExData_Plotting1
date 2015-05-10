library(dplyr)
library(lubridate)
data <- read.table("hpc.txt",  header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")
subdata <- filter(data, dmy(Date) >= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"))
subdatadt <- mutate (subdata, 
                   dateTime=parse_date_time(paste(subdata$Date,subdata$Time), 
                   orders="dmy_hms"))
png(file="plot2.png", 480, 480)
par( pty="s",yaxp = c(0,8,2),
     mar=c(6.1, 4.1, 4.1, 2.1)) 

plot(subdatadt$dateTime, subdatadt$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="", type="n")
lines(subdatadt$dateTime, subdatadt$Global_active_power,
      type="l")
dev.off()