con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)

sapply(c(10, 20, 30, 100), function(l) { nchar(htmlCode[l]) })