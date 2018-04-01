## @knitr q03_a

filename <- "Unit11TimeSeries_Gregorovitch.csv"
dataURL <- paste(dbxroot, filename, sep="")
gregorovitch <- read.csv(url(dataURL), header=FALSE)
names(gregorovitch) <- c("SYear", "NumSold")
gregorovitch$SYear <- trimws(as.character(gregorovitch$SYear))

filename <- "Unit11TimeSeries_Ollivander.csv"
dataURL <- paste(dbxroot, filename, sep="")
ollivander <- read.csv(url(dataURL), header=FALSE)
names(ollivander) <- c("SYear", "NumSold")
ollivander$SYear <- trimws(as.character(ollivander$SYear))