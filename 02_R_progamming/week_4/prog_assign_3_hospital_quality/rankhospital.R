rankhospital <- function(state, outcome, num = "best") {
    
    library(plyr)
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    
        
    ## Check that state and outcome are valid
    if(!any(data$State == state)) stop("invalid state") 
    if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("invalid outcome") 
    if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    # [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
    # [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"               
    # [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    
    if(outcome == "heart attack")   col <- 11
    if(outcome == "heart failure")  col <- 17
    if(outcome == "pneumonia")      col <- 23
    
    data <- data[data$state==state & data[,col] != 'Not Available', ]    
    data[,col] <- as.data.frame(sapply(data[,col], as.numeric))
    data <- data[!is.na(data[,col]),]
    data <- data[order(data$Hospital.Name, decreasing = FALSE), ]
    data <- data[order(data[outc,col], decreasing = FALSE), ]
        
    if(num == "best") return(data$Hospital.Name[1])
    if(num == "worst") return(data$Hospital.Name[length(data$Hospital.Name)])
    
    data$Hospital.Name[num]
    
}