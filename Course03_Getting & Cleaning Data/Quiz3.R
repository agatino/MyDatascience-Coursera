### Getting and Cleaning Data - John Hopkins University
### Quiz 3
### Parsing different web data formats

### Written by Billy.Ljm
### 17 August 2014
### MIT License
require(data.table)
require(jpeg)
require(Hmisc)

### Q1. Create binary varaible
# Create a "agricultureLogical" logical vector that identifies the households 
# on greater than 10 acres and who sold more than $10,000 worth of agriculture products
# codebook is at https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
dataURL  = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(dataURL, "ACS.csv", quiet = TRUE)
data <- fread("ACS.csv", sep = ",", header = TRUE, na.strings = "")
data$agricultureLogical = data$ACR == 3 & data$AGS == 6
qn1_ans <- which(data$agricultureLogical)[1:3]
print(sprintf("Q1. %s is the rows where data$agricultureLogical is TRUE." ,paste(qn1_ans, collapse = ",")))

### Q2. Quantiles
# Read the jpeg & get the 30th & 80th quantile of the resulting data
dataURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(dataURL, "jeff.jpg", mode = "wb", quiet = TRUE)
data <- readJPEG("jeff.jpg", native = TRUE)
qn2_ans <- quantile(data, c(0.3, 0.8))
print(sprintf("Q2. %s is the 30th & 80th qunatile of the data.", paste(qn2_ans, collapse = ",")))

### Q3. Merge & sort data
# Match the data based on the country shortcode
# How many of the IDs match? 
# Sort the data frame in descending order by GDP rank. What is the 13th country in the resulting data frame? 
dataURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(dataURL, "GDP.csv", quiet = TRUE)
dataURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(dataURL, "edu.csv", quiet = TRUE)
edu <- read.csv("edu.csv", na.strings = "", blank.lines.skip = TRUE)
GDP <- read.csv("GDP.csv", header = FALSE, na.strings = "", skip = 5, blank.lines.skip = TRUE, nrows = 190,
				colClasses = c("character", "integer", "NULL", "character", "character", rep("NULL", 5)))
names(GDP) <- c("CountryCode", "GDP.Rank", "CountryName", "GDP")
data <- merge(GDP, edu, by = "CountryCode", all = TRUE)
qn3_ans = nrow(GDP) + nrow(edu) - nrow(data)
data <- data[order(data$GDP.Rank, decreasing = TRUE),]
qn3_ans = c(qn3_ans, data[13, "CountryName"]) 
print(sprintf("Q3. %s is the number of IDs that match & the 13th country in the data frame.", paste(qn3_ans, collapse = ", ")))


### Q4. Subsetting & average
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group
data$Income.Group <- as.factor(data$Income.Group)
qn4_ans <- mean(data[data$Income.Group == "High income: OECD", "GDP.Rank"], na.rm = TRUE)
qn4_ans <- c(qn4_ans, mean(data[data$Income.Group == "High income: nonOECD", "GDP.Rank"], na.rm = TRUE))
print(sprintf("Q4. %s is the mean GDP ranking for the High income: OECD & nonOECD groups", paste(qn4_ans, collapse = ",")))

### Q5.
data$GDP.Rank.Group <- cut2(data$GDP.Rank, g = 5)
qn5_ans <- sum(as.numeric(data$GDP.Rank.Group) == 1 & data$Income.Group == "Lower middle income", na.rm = TRUE)
print(sprintf("Q5. %s is the number of countries in the Lower middle income group With one of the 38 highest GDP", qn5_ans))