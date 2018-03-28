## @knitr q01_a

# EU Stock Data 1990 - 1999
#
str(EuStockMarkets)

head(EuStockMarkets)

# German Stock Exchange
#
dax <- EuStockMarkets[,1]
