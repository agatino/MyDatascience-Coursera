### Exploratory Data Analysis - John Hopkins University
### Course Project 2: Plot 2
### Plotting histograms

### Written by Billy.Ljm
### 21 August 2014
### MIT License
require(plyr)

# Download data
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataURL, "NEI.zip")
unzip("NEI.zip")

# Process data
data <- readRDS("summarySCC_PM25.rds")
data <- data[data$fips == "24510",]
data <- ddply(data, .(year), summarise, Emissions = sum(Emissions)/1e3)

# Plot graph
png("plot2.png")
par(mar=c(5.1,6.1,4.1,2.1), pch = 19)
plot(data$year, data$Emissions, type = "p", main="Baltimore City's Annual PM2.5 Emissions", 
	 xlab="Year", ylab="PM2.5 Emissions\n(thousand tonnes)", xaxt='n')
lines(data$year, data$Emissions, type = "l")
axis(1, c(1999, 2002, 2005, 2008)) # custom x-axis tick marks
abline(v=seq(1999,2008,1), col = "grey", lty="dotted") # gridlines
abline(h=seq(1.8,3.3,0.1), col = "grey", lty="dotted")
dev.off()