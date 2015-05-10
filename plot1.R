library(dplyr)
library(lubridate)
data <- read.table("hpc.txt",  header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")
subdata <- filter(data, dmy(Date) >= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"))
png(file="plot1.png", 480, 480)
par( lab=c(4,7, 7), yaxs="i", pty="s",
     mar=c(6.1, 4.1, 4.1, 2.1)) 

hist(subdata$Global_active_power,xlab="Global Active Power (kilowatts)",
     main="Global Active Power", xlim=(c(0,6)), ylim=c(0,1200),
     col="red",
     border="black")

dev.off()