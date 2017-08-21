#plot2

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
par(mar=c(4,4,2,12))

#plot
plot(data$Time, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(data$Time, data$Global_active_power)

#export png
dev.copy(png, file = "plot2.png")
dev.off()
