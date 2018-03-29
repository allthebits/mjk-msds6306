## @knitr q02_d

holt_maxtemp_post_1990_5_yr <- holt(maxtemp_post_1990, initial="optimal", alpha=0.8, beta=0.2, damped=TRUE, exponential=TRUE, h=5)

# The Predicted Values
plot(holt_maxtemp_post_1990_5_yr, ylab="Temperature", xlab="Year", fcol="white", type="o", col="blue")

# The Fitted Values
holt_fit_maxtemp_post_1990_5_yr <- fitted(holt_maxtemp_post_1990_5_yr)
lines(holt_fit_maxtemp_post_1990_5_yr, col="red", type="o")

# The Forecasted Values
lines(holt_maxtemp_post_1990_5_yr$mean, col="green", type="o")

legend("topleft", lty=1, col=c("blue", "red", "green"), c("Predicted", "Fitted", "5 Year Forecast"), pch=1)

# I have NO idea what this is actually doing, but it gives me a value....
#
aic_holt_fit_maxtemp_post_1990_5_yr <- AICc(ets(holt_fit_maxtemp_post_1990_5_yr))
aic_holt_fit_maxtemp_post_1990_5_yr