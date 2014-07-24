## R Programming - John Hopkins University
## Programming Assigment 1: Part 1
## Air Pollution

## written by Billy.ljm
## 19 July 2014
## MIT License

pollutantmean <- function(directory, pollutant, id = 1:332){
	## returns: mean of a pollutant across specified list of monitors
	## directory: location of CSV files (char)
	## pollutant: name of pollutant to calculate mean for (char)
	## id: monitor ID numbers to be used (num/num vector)
	## Note: csv must be named [id, %03d].csv (e.g. "021.csv")
	
	# Read all csv
	dataDir <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
	datas <- lapply(dataDir, read.csv, na.strings = "NA") 
	
	# extract pollutant data & merge into 1 vector
	pollutantData <- vector(mode = "numeric") 
	for(data in datas)
		pollutantData <- c(pollutantData, data[,pollutant])
	
	return(mean(pollutantData, na.rm = TRUE))
}