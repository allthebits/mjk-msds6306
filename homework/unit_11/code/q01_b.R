## @knitr q01_b

# Plot the time-series data
plot(dax, xlab="Year", ylab="Closing Price", main="EuStockMarkets: DAX Index from 1991 to 1998", col="blue")

# Add plot at 1997
abline(v=1997, col="red")