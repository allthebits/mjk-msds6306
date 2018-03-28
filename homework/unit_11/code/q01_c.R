## @knitr q01_c

# https://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html#decomposing-seasonal-data

#sesfit <- ses(dax, alpha=0.8, initial="simple", exponential=TRUE, h=10)
#holtfit <- holt(dax, alpha=0.8, beta=0.2, initial="simple", exponential=TRUE, h=10)
#hwfit <- hw(dax, seasonal="multiplicative", initial="simple")

comps <- decompose(dax, type = "multiplicative" )

plot(comps, xlab="Year", col="blue")

title("\n\nEuStockMarkets: DAX Index from 1990 to 1999 - Decomposition")

abline(v=1997, col="red")
