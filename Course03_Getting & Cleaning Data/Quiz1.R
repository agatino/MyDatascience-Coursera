### Getting and Cleaning Data - John Hopkins University
### Quiz 1
### Parsing different raw data formats

### Written by Billy.Ljm
### 05 August 2014
### MIT License
require(data.table)
require(xlsx)
require(XML)

### Q1. csv Files
# Read the csv file in dataURL
# The code book, describing the variable names is https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# How many properties are worth $1,000,000 or more? 
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(dataURL, destfile = "./housing.csv", quiet = TRUE)
data <- fread("./housing.csv")
data <- data[, .N, by = VAL]
qn1_ans <- data[val == 24][[2]]
print(sprintf("Q1. %d properties are worth $1mil or more.", qn1_ans))

### Q3. xlsx Files
# Download the xlsx file in dataURL
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called dat
# What is the value of sum(dat$Zip*dat$Ext,na.rm=T) 
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(dataURL, destfile = "./naturalgas.xlsx", mode = "wb", quiet = TRUE)
data <- read.xlsx("./naturalgas.xlsx", sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23)
qn3_ans = sum(data$Zip*data$Ext,na.rm=T) 
print(sprintf("Q3. %d is the result of the expression.", qn3_ans))

### Q4. xml Files
# Read the xml file in dataURL
# How many restaurants have zipcode 21231? 
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(dataURL, destfile = "./restaurants.xls", quiet = TRUE)
data <- xmlTreeParse("./restaurants.csv", useInternal = TRUE)
data <- xmlRoot(data)
qn4_ans = 0
xpathSApply(data, "//zipcode", function(zipcode){
	if(xmlValue(zipcode) == 21231) 
		qn4_ans <<- qn4_ans + 1
	})	
print(sprintf("Q4. %d restaurants have the zipcode 21231.", qn4_ans))

# data clean-up
remove(data)
remove(dataURL)