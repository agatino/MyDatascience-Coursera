### Getting and Cleaning Data - John Hopkins University
### Quiz 2
### Parsing different web data formats
### Note: Q1 requires the client ID & client secret of a GitHub App

### Written by Billy.Ljm
### 09 August 2014
### MIT License
require(httr)
require(jsonlite)

### Q1. OAuth
## Access the GitHub API to get information on your instructors repositories ("https://api.github.com/users/jtleek/repos"). 
## Use this data to find the time that the datasharing repo was created. 
# App keys
ClientID <- ??? # ENTER YOUR OWN GITHUB APP INFO
ClientSecret <- ??? # ENTER YOUR OWN GITHUB APP INFO
# Authenticate
app <- oauth_app("github", ClientID, ClientSecret)
token <- oauth2.0_token(oauth_endpoints("github"), app)
token <- config(token = token)
# API request
req <- with_config(token, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
data <- content(req, as = "text")
# Format data & get ans
data <- fromJSON(data)
qn1_ans <- data$created_at[data$name == "datasharing"]
print(sprintf("Q1. %s is the date the repo was created." ,qn1_ans))


### Q4. Web scraping
# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from 
# "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
data <- readLines(con)
close(con)
qn2_ans <- nchar(data[c(10,20,30,100)])
qn2_ans <- paste(qn2_ans, collapse =" ")
print(sprintf("Q4. %s are the number of characters in the respecitve lines", qn2_ans))


### Q5. Foregin file (Fixed-width file)
# Read the data set into R and report the sum of the numbers in the fourth column
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(dataURL, "./SeaTemp.for", quiet = TRUE)
data <- read.fwf("./SeaTemp.for", c(15,4,9,4,9,4,9,4,9), header = FALSE, skip = 4, strip.white =TRUE)
qn5_ans <- sum(data[,4])
print(sprintf("Q5. %s is the sum of the numbers in the 4th column", qn5_ans))

### Clean-up
remove(data, ClientID, ClientSecret, req, token, app, con, dataURL)
