## @knitr q03_d

# colnames(xts_greg) <- c("SYear", "NumSoldGreg", "Year")
# colnames(xts_oll) <- c("SYear", "NumSoldOll", "Year")

# Create a dataframe to merge the data properly and then create an xts Object
#
df_temp <- data.frame(gregorovitch$Year, ollivander$Year, gregorovitch$NumSold, ollivander$NumSold)
names(df_temp) <- c("Year", "OYear", "GregNumSold", "OllNumSold")

# Cross check/verify to make sure the rows match up
#
allEqual <- sum(df_temp$Year == df_temp$OYear)
missing <- sum(df_temp$Year != df_temp$OYear)

sprintf("Number rows with equal Date: %d, Number rows with unequal Date: %d", allEqual, missing)

# Remove the Year Columns now that we have verified everything is OK
#
xts_temp <- as.xts(x=df_temp, order.by = df_temp$Year)
xts_temp <- xts_temp[,colnames(xts_temp) != "Year"]
xts_temp <- xts_temp[,colnames(xts_temp) != "OYear"]


# None of these worked in merging the 2 xts Objects
# xts_temp <- rbind(xts_greg, xts_greg)
# merge(xts_temp, xts_greg, by="SYear")

# Now plot the dygraph
#
dygraph(xts_temp, main="Number of Wands Sold by Year") %>% 
  dySeries("GregNumSold", label = "Gregorovitch") %>% 
  dySeries("OllNumSold", label = "Ollivander")