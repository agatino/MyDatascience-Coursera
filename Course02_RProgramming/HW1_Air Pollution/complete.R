## R Programming - John Hopkins University
## Programming Assigment 1: Part 2
## Air Pollution

## written by Billy.ljm
## 19 July 2014
## MIT License

complete <- function(directory, id = 1:332) {	
	## returns: data frame w/ colnames = [id, nobs(num of complete cases)]
	## directory: location of the CSV files (char)
	## id: monitor ID numbers (num/num vector)
	## Note: csv must be named [id, %03d].csv (e.g. "021.csv")
	
	# Read all csv
	dataDir <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
	datas <- lapply(dataDir, read.csv, na.strings = "NA") 
	
	# Count complete cases in each csv & populate output dataframe
	out <- data.frame(id = numeric(length(id)), nobs = numeric(length(id)))
	for(i in 1:length(id)){
		tmp <- complete.cases(datas[[i]])
		out[i, 1] <- id[i]
		out[i, 2] <- length(tmp[tmp == TRUE])
	}
	
	return(out)
}