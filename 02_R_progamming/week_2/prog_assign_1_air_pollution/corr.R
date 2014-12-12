# Working directory
setwd("d://GitHub//datasciencecoursera//02_R_progamming/week_2/prog_assign_1_air_pollution/")

# Submission script
source("rprog-scripts-submitscript1.R")

# Libraries
library(data.table)
library(tools)


# Part 3
corr <- function(directory, threshold = 0) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- sapply(1:332, function(i) {paste(directory, paste(sprintf("%03d",i), "csv", sep="."), sep="/")})
  
  data <- rbindlist(lapply(files, function(f) { fread(f, drop=TRUE) }))
  
  data <- data[apply(data, 1, function(r) { all(!is.na(r)) })]
  
  corr <- sapply(1:332, function(i) { if(sum(data$ID ==i) >= threshold) return(cor(data$sulfate[data$ID ==i], data$nitrate[data$ID ==i])) else NA })
  
  corr <- corr[!is.na(corr)]
  
  return(corr)
  
}
