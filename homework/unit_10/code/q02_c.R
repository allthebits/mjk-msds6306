## @knitr q02_c

mh2015_merge$HospitalPer_1k_Miles <- 0.0

statecount <- data.frame(matrix(ncol = 4, nrow = 0))
colnames(statecount) <- c("STATE", "HospitalPer_1k_Miles", "SqMiles", "COUNT")

for (rowcnt in 1:nrow(statesize)) {
    # Get the count of Hospitals per state
    totalcount <- length( which( mh2015_merge$STATE == statesize[rowcnt,]$STATE ) )
    # calculate hospitals per 1000 square miles per state
    per1k <- (totalcount * 1000) / statesize[rowcnt,]$SqMiles
    # populate the merge dataframe
    mh2015_merge$HospitalPer_1k_Miles[mh2015_merge$STATE == statesize[rowcnt,]$STATE] <- per1k
}
