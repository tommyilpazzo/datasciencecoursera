# Working directory
setwd("d://GitHub//datasciencecoursera//02_R_progamming/week_2/prog_assign_1_air_pollution/")

# Submission script
source("rprog-scripts-submitscript1.R")

# Libraries
library(data.table)
library(tools)

# Part 2
complete <- function(directory, id = 1:332) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- sapply(id, function(i) {paste(directory, paste(sprintf("%03d",i), "csv", sep="."), sep="/")})
  
  data <- rbindlist(lapply(files, function(f) { fread(f, drop=TRUE) }))
  
  data <- data[apply(data, 1, function(r) { all(!is.na(r)) })]
  
  return(as.data.frame(rbindlist(lapply(id, function(i) { return(data.table(id = i, nobs = sum(data$ID == i))) }))))
  
}
