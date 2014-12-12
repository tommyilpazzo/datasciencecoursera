# Working directory
setwd("d://GitHub//datasciencecoursera//02_R_progamming/week_2/prog_assign_1_air_pollution/")

# Submission script
source("rprog-scripts-submitscript1.R")

# Libraries
library(data.table)
library(tools)

# Part 1
pollutantmean <- function(directory, pollutant, id = 1:332) {

  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
    
  files <- sapply(id, function(i) {paste(directory, paste(sprintf("%03d",i), "csv", sep="."), sep="/")})
  
  data <- rbindlist(lapply(files, fread))
  
  return(round(mean(data[[pollutant]], na.rm = TRUE),3))
  
}

# Part 1's tests 
stopifnot(pollutantmean("specdata", "sulfate", 1:10) == 4.064)
stopifnot(pollutantmean("specdata", "nitrate", 70:72) == 1.706)
stopifnot(pollutantmean("specdata", "nitrate", 23) == 1.281)