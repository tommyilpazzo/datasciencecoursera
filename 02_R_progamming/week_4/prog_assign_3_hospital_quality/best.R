best <- function(state, outcome) {
    
    library(plyr)
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    
    data <- arrange(data,Hospital.Name)
    
    ## Check that state and outcome are valid    
    if(!any(data$State == state)) stop("invalid state") 
    if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("invalid outcome") 
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    # [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
    # [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"               
    # [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    
    if(outcome == "heart attack")   col <- 11
    if(outcome == "heart failure")  col <- 17
    if(outcome == "pneumonia")      col <- 23
    
    data <- data[data$State == state,]
    data[,col] <- as.numeric(data[,col])
    
    data$Hospital.Name[which(data[,col] == min(data[,col], na.rm = TRUE))[1]]
        
}