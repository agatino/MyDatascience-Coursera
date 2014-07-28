## R Programming - John Hopkins University
## Programming Assigment 3: Part 3
## Hospital Quality

## written by Billy.ljm
## 28 July 2014
## MIT License

rankhospital <- function(state, outcome, num = "best"){
	### Returns hospital name of the hospital in `state`(s) 
	### with `num` rank in lowest 30-day mortality rate in `outcome`
	
	# Vector of all valid states
	validStates = c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", 
					"FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", 
					"LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", 
					"NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", 
					"OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", 
					"UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY", "GU")
	
	# Map all valid outcomes to relevant mortality rate colname in data file
	outcomeMap = list("heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
					  "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
					  "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
	
	# Make arguments case-insensitive
	state = toupper(state)
	outcome = tolower(outcome)
	
	# Check arguments' validity
	if(!(all(state %in% validStates)))
		stop("invalid state")
	if(!(length(outcome) ==  1 && outcome %in% names(outcomeMap)))
		stop("invalid outcome")
	
	# Get relevant data, sort & return
	data <- read.csv("outcome-of-care-measures.csv", colClasses = 'character', na.strings = "Not Available") # read data
	data <- subset(data, State %in% state, select = c("Hospital.Name", outcomeMap[[outcome]]))
	colnames(data) <- c("hospital", "rate") # format data
	data[,"rate"] <- as.numeric(data[,"rate"])
	data <- na.omit(data)
	data <- data[order(data[,"rate"], data[,"hospital"]),] # sort data
	
	# Convert num to actual numeric
	if(num == "best")
		num <- 1
	else if(num == "worst")
		num <- nrow(data)

	# Return
	if(num > nrow(data))
		return(NA)
	data[num, "hospital.name"]
}