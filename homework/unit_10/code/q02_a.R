## @knitr q02_a

filename <- "statesize.csv"
dataURL <- paste(dbxroot, filename, sep="");
statesize <- read.csv(url(dataURL));

sprintf("Statesize DF row count is %d", nrow(statesize))

mh2015_merge <- merge(mh2015_filtered, statesize)

cnt_orig <- nrow(mh2015_filtered)
cnt_merge <- nrow(mh2015_merge)
merge_fact <- cnt_merge / cnt_orig

length(which(mh2015_filtered$CASEID == 201500001))
length(which(mh2015_merge$CASEID == 201500001))

sprintf("%d rows in Original DF, %d rows in Merged DF, Merged DF increased by factor of %.3f", cnt_orig, cnt_merge, merge_fact)
