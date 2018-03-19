## @knitr q02_c

statecount <- data.frame(c())
for (rowcnt in 1:nrow(statesize)) {
    onerow = statesize[1,]
    totalcount <- length( filter(mh2015_merge, STATE == onerow$STATE) )
    totalcount
}