### Exploratory Data Analysis - John Hopkins University
### Course Project 2: Plot 6
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
data <- data[data$type == "ON-ROAD" & (data$fips == "24510" | data$fips == "06037"),]
data <- ddply(data, .(year, fips), summarise, Emissions = sum(Emissions))
data$fips <- ifelse(data$fips == "24510", "Baltimore City", "Los Angeles County")
names(data) <- c("Year", "County", "Emissions")

# Plot graph
plot <- ggplot(data, aes(x = Year, y = Emissions)) + facet_grid(County~., scale="free")
plot <- plot + geom_line() + geom_point()
plot <- plot + ggtitle("Annual PM2.5 Emission from\nBaltimore City & Los Angeles County") + ylab("Emissions\n(tonnes)")
plot <- plot + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))

# Save plot
png("plot6.png")
plot
dev.off()