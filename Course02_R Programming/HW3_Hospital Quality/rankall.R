## R Programming - John Hopkins University
## Programming Assigment 3: Part 4
## Hospital Quality

## written by Billy.ljm
## 28 July 2014
## MIT License

rankall <- function(outcome, num = "best"){
	### Returns hospital name of the hospital in `state`(s) 
	### with `num` rank in lowest 30-day mortality rate in `outcome`
	
	
	.numSelect <- function(data, num){
		### Get ("hospital", "state") for  `num` row in data of ("hospital", "state", ...)
		### Helper function for lapply in line 56
		
		state = data[1,"state"]
		
		# get values
		if(num == "best")
			out = head(data, 1)[,c("hospital","state")]
		else if(num == "worst")
			out = tail(data, 1)[,c("hospital","state")]
		else if(num > nrow(data))
			out = data.frame(cbind(NA, data[1,"state"]))
		else
			out = data[num,c("hospital","state")]
		
		# format output data frame
		colnames(out) <- c("hospital", "state")
		row.names(out) <- state
		return(out)
	}
	
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
	
	# Check arguments' validity
	outcome = tolower(outcome)
	if(!(length(outcome) ==  1 && outcome %in% names(outcomeMap)))
		stop("invalid outcome")
	
	# Get relevant data, sort & return
	data <- read.csv("outcome-of-care-measures.csv", colClasses = 'character', na.strings = "Not Available") # read data
	data <- data[,c("Hospital.Name", "State", outcomeMap[[outcome]])]
	colnames(data) <- c("hospital", "state", "rate") # format data
	data[,"rate"] <- as.numeric(data[,"rate"])
	data <- na.omit(data)
	data <- data[order(data[,"rate"], data[,"hospital"]),] # sort data
	
	# Get best hospital for each state & return
	data <- split(data, data[,"state"])
	out = data.frame()
	lapply(data, (function(x) out <<- rbind(out, .numSelect(x, num))))
	out
}