### Exploratory Data Analysis - John Hopkins University
### Course Project 2: Plot 3
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
data <- data[data$fips == 24510,]
data <- ddply(data, .(year, type), summarise, emissions = sum(Emissions))
names(data) <- c("Year", "SourceType", "Emissions")

# Plot graph
plot <- ggplot(data, aes(x = Year, y = Emissions)) + facet_grid(SourceType~., scales = "free")
plot <- plot + geom_line() + geom_point()
plot <- plot + ggtitle("Baltimore City's Annual PM2.5 Emission\nby source type") + ylab("Emissions\n(tonnes)")
plot <- plot + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))

# Save plot
png("plot3.png")
plot
dev.off()