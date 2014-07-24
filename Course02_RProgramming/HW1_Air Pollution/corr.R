## R Programming - John Hopkins University
## Programming Assigment 1: Part 3
## Air Pollution

## written by Billy.ljm
## 19 July 2014
## MIT License

corr <- function(directory, threshold = 0) {
	## Return: correlation coeffs b/w sulfate & nitrate for each id (num/num vector)
	## directory: location of the CSV files (char)
	## threshold: number of completely cases needed to compute correlation (num)
	## Note: csv must be named [id, %03d].csv (e.g. "021.csv")
	
	# Get all ids wich passes threshold
	source("complete.R")
	numCmpl <- complete(directory)
	id <- numCmpl[numCmpl$nobs > threshold, "id"]
	
	# If none pass threshold, return empty numeric vector
	if(length(id) == 0)
		return(vector(mode = "numeric"))
	
	# Read all csv 
	dataDir <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
	datas <- lapply(dataDir, read.csv, na.strings = "NA") 
	
	# Calculate correlations & store
	out <- vector(mode = "numeric")
	for(data in datas){
		dataCorr = cor(data$sulfate, data$nitrate, use = "complete.obs")
		out <- c(out, dataCorr)
	}
	
	return(out)
}