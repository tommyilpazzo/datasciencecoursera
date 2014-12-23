rankall <- function(outcome, num = "best") {
    
    library(plyr)
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")   
    
    ## Check that state and outcome are valid
    if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("invalid outcome") 
    if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
    
    ## For each state, find the hospital of the given rank
    
    # [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
    # [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"               
    # [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    
    if(outcome == "heart attack")   col <- 11
    if(outcome == "heart failure")  col <- 17
    if(outcome == "pneumonia")      col <- 23
    
    data <- data[data[,col] != 'Not Available', ]    
    data[,col] <- as.data.frame(sapply(data[,col], as.numeric))    
    data <- data[, c(2, 7, col)]
    colnames(data) <- c("hospital", "state", "outcome")
    data <- data[order(data$state, data$outcome, data$hospital, decreasing = FALSE), ]
    
    data <- aggregate(data, list(state = data$state), function(x){ 
        
        n <- num
        if(num == "best") n <- 1
        if(num == "worst") n <- length(x)
        
        return(x[n])
    })
        
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data[c("hospital","state")]
    
}