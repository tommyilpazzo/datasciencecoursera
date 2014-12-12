con <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
data <- readLines(con)
close(con)

col4 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 29, 32)) } ))

# col2 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 15, 19)) } ))
# col3 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 20, 23)) } ))
# col4 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 28, 32)) } ))
# col5 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 33, 36)) } ))
# col6 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 41, 45)) } ))
# col7 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 46, 49)) } ))
# col8 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 54, 58)) } ))
# col9 <- sum(sapply(data[5:length(data)], function(l) { as.double(substr(l, 59, 62)) } ))

