x <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"))
head(which(x$AGS==6 & x$ACR==3), n=3)

# 125, 238, 262

getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "getdata-jeff.jpg")
img.n <- readJPEG("C:/Users/tbolis/Documents/getdata-jeff.jpg", TRUE)
quantile(img.n, probs = seq(0.30,0.80))

# -15259150 -10575416 

library("dplyr");
gdp <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"))
ed <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "))

data <- inner_join(gdp[5:194,], ed, by = c("X" = "CountryCode"))
data <- transform(data, Gross.domestic.product.2012 = as.numeric(as.character(Gross.domestic.product.2012)))
data <- arrange(data, desc(Gross.domestic.product.2012))

data[13,"X"]

# 189, St. Kitts and Nevis

mean(data[data$Income.Group == "High income: OECD","Gross.domestic.product.2012"])
mean(data[data$Income.Group == "High income: nonOECD","Gross.domestic.product.2012"])

# 32.96667, 91.91304

library(Hmisc)
rankGroups <- table(cut2(data$Gross.domestic.product.2012,g=5))
rankGroupLevels <- levels(cut2(data$Gross.domestic.product.2012,g=5))
data2 <- mutate(data,rankGroup=cut2(data$Gross.domestic.product.2012,g=5))

group5 <- data2[data2$rankGroup == rankGroupLevels[5],]

sum(data$Income.Group[154:189] == "Lower middle income")

# 5



