## @knitr q03_c

xts_greg <- as.xts(x=gregorovitch, order.by = gregorovitch$Year)
# xts_greg <- xts_greg[,colnames(xts_greg) != "Year"]

xts_oll <- as.xts(x=ollivander, order.by = ollivander$Year)
# xts_oll <- xts_oll[,colnames(xts_oll) != "Year"]