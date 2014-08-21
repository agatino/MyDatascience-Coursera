### Exploratory Data Analysis - John Hopkins University
### Course Project 2: Plot 4
### Plotting histograms

### Written by Billy.Ljm
### 21 August 2014
### MIT License
require(ggplot2)
require(plyr)

# Download data
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataURL, "NEI.zip")
unzip("NEI.zip")

# Process data
data <- readRDS("summarySCC_PM25.rds")
data <- ddply(data, .(year, SCC), summarise, Emissions = sum(Emissions)) # Compress data for faster merging
label <- readRDS("Source_Classification_Code.rds")
label <- label[,c("SCC", "EI.Sector")] # Compress data for faster merging
data <- merge(data, label, by="SCC")
coalIndex <- sapply(data$EI.Sector, function(x) grepl("Fuel Comb - [a-zA-z ,]* - Coal", x))
data <- data[coalIndex,]
data <- ddply(data, .(year), summarise, Emissions = sum(Emissions)/1e3)
names(data) <- c("Year", "Emissions")

# Plot graph
plot <- ggplot(data, aes(x = Year, y = Emissions))
plot <- plot + geom_line() + geom_point()
plot <- plot + ggtitle("US Annual PM2.5 Emission from\nCoal Combustion-Related Sources") + ylab("Emissions\n(thousand tonnes)")
plot <- plot + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))

# Save plot
png("plot4.png")
plot
dev.off()