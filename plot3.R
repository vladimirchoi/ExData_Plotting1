#plot3

#download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.delim(unz(temp, "household_power_consumption.txt"), sep=";", na.strings="?", stringsAsFactors=FALSE)
unlink(temp)

#convert dates
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset file by date
data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

#convert times
data$Time <- strptime(paste(as.character(data$Date), data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#set parameters
par(pin=c(3,3))

#plot
plot(data$Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#export png
dev.copy(png, file = "plot3.png")
dev.off()
