### Getting and Cleaning Data - John Hopkins University
### Quiz 4
### Parsing different web data formats

### Written by Billy.Ljm
### 26 August 2014
### MIT License

require(quantmod)
options("getSymbols.warning4.0"=FALSE)

### Q1. strplit
# Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
# What is the value of the 123 element of the resulting list?
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "ACS.csv", quiet = TRUE)
data <- read.csv("ACS.csv", nrows = 1)
data <- strsplit(names(data), "wgtp")
qn1_ans <- data[[123]]
print(sprintf("Q1. %s is the value of the 123rd element.", paste("'",qn1_ans,"'", collapse = " ", sep="")))

### Q2. Fixed pattern
# Remove the commas from the GDP numbers in millions of dollars and average them. 
# What is the average? 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ", "GDP.csv", quiet = TRUE)
data <- read.csv("GDP.csv", header = FALSE, na.strings = "", skip = 5, blank.lines.skip = TRUE, nrows = 190,
				 colClasses = c("character", "integer", "NULL", "character", "character", rep("NULL", 5)))
names(data) <- c("CountryCode", "GDP.Rank", "CountryName", "GDP")
data$GDP <- gsub(",", "", data$GDP)
data$GDP <- as.numeric(data$GDP)
qn2_ans <- mean(data$GDP)
print(sprintf("Q2. %.01f is the average", qn2_ans))

### Q3. Regex
# How many countries begin with United? 
qn3_ans <- sum(grepl("^United",data$CountryName))
print(sprintf("Q3. %d is the number of countries that begin with 'United'", qn3_ans))

### Q4.Regex
# Of the countries for which the end of the fiscal year is available, how many end in June? 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv ", "edu.csv", quiet = TRUE)
data <- read.csv("edu.csv", na.strings = "", blank.lines.skip = TRUE)
qn4_ans = sum(grepl("^Fiscal year end: June", data$Special.Notes))
print(sprintf("Q4. %d is the number of fiscal years which ended in June", qn4_ans))

### Q5. Date class
# How many values were collected in 2012? 
# How many values were collected on Mondays in 2012?
data <- getSymbols("AMZN", auto.assign=FALSE)
data <- index(data)
data <- strptime(data, "%Y-%m-%d")
data <- data[data$year == 2012 - 1900]
qn5_ans <- c(length(data), sum(weekdays(data) == "Monday"))
print(sprintf("Q5. %s is the number collected in 2012, on Mondays in 2012 respectively", 
			  paste(qn5_ans, collapse =", ")))
