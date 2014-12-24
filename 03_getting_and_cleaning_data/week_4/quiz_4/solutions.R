download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
data <- read.csv("getdata-data-ss06hid.csv")
result <- sapply(names(data), strsplit, "wgtp")
result[123]

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
data <- read.csv("getdata-data-GDP.csv")
data <- data[5:194,]
data$X.3 <- gsub(",","",data$X.3)
data$X.3 <- as.numeric(data$X.3)
mean(data$X.3, na.rm = TRUE)

length(grep("^United",data$X.2))

library(reshape2)
library(plyr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv ")
gdpData <- read.csv("getdata-data-GDP.csv")
gdpData <- gdpData[5:194,]
eduData <- read.csv("getdata-data-EDSTATS_Country.csv")
data <- merge(gdpData, eduData, by.x="X", by.y="CountryCode", all=TRUE)
length(grep(pattern = "^Fiscal year end: June",x = data$Special.Notes))

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
length(grep("^2012", as.character(index(amzn))))
length(grep("^2012 lun", as.character(format(index(amzn), "%Y %a"))))


