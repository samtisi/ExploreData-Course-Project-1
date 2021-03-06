setwd("~/Coursera/workspace/exdata-data-household_power_consumption")
initial <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, nrow=100)
classes <- sapply(initial, class)
#initial$Date <- as.Date(initial$Date, "%d/%m/%Y")
rt <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = classes)
rt$Date <- as.Date(rt$Date, "%d/%m/%Y")  #Changes date from Factor to Date
x <- paste(rt$Date, rt$Time)
rt$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
#summary(rt)
u <- rt$Date == "2007-02-01" | rt$Date == "2007-02-02"
#summary(u)
#summary(rt[u,])
subset <- rt[u, ]
#summary(subset)
png(file="plot1.png",width=480, height=480)
hist(subset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
#dev.copy(png,filename="plot1.png");
dev.off ();
