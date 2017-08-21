#plot1

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
par(mar=c(4,4,2,2))

#plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#export png
dev.copy(png, file = "plot1.png")
dev.off()
