## @knitr q03_d

# colnames(xts_greg) <- c("SYear", "NumSoldGreg", "Year")
# colnames(xts_oll) <- c("SYear", "NumSoldOll", "Year")

df_temp <- data.frame(gregorovitch$Year, ollivander$Year, gregorovitch$NumSold, ollivander$NumSold)
names(df_temp) <- c("Year", "OYear", "GregNumSold", "OllNumSold")

# Cross check to make sure the rows match up
allEqual <- sum(df_temp$Year == df_temp$OYear)
missing <- sum(df_temp$Year != df_temp$OYear)

sprintf("Number rows with equal Date: %d, Number rows with unequal Date: %d", allEqual, missing)


xts_temp <- as.xts(x=df_temp, order.by = df_temp$Year)

# None of these worked in merging the 2 xts Objects
# xts_temp <- xts_oll[,colnames(xts_temp) != "Year"]
# xts_temp <- xts_oll[,colnames(xts_temp) != "OYear"]
# xts_temp <- rbind(xts_greg, xts_greg)
# merge(xts_temp, xts_greg, by="SYear")


dygraph(xts_temp)
