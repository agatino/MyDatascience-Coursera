### Roma March 8 2015
### Agatino Grillo


require(data.table)

### Download & unzip data
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataURL, "./tmp.zip")
unzip("./tmp.zip")
file.remove("./tmp.zip")

### Read data
# Get headers (because skip used later)
header <- scan("./household_power_consumption.txt", what = character(), nlines = 1, quiet = TRUE)
header <- strsplit(header, ";")

# Read data with filter those w/ desired dates
data <- fread("./household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", skip = 66600, nrows = 4000)
setnames(data, header[[1]])
remove(header)
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Merge date & time into single column
dateTime <- as.POSIXct(paste(data$Date, data$Time, sep = ";"), format = "%d/%m/%Y;%H:%M:%S")
data$Date <- NULL
data$Time <- NULL
data <- cbind("DateTime" = dateTime, data)
remove(dateTime)

### Plot graph
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
