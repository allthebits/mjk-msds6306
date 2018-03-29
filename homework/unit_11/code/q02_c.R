## @knitr q02_c

maxtemp_ses_post_1990_5_yr <- ses(maxtemp_post_1990, alpha=0.8, initial="simple", exponential=TRUE, h=5)

# The Predicted Values
plot(maxtemp_ses_post_1990_5_yr, ylab="Temperature", xlab="Year", fcol="white", type="o", col="blue")

# The Fitted Values
fit_maxtemp_ses_post_1990_5_yr <- fitted(maxtemp_ses_post_1990_5_yr)
lines(fit_maxtemp_ses_post_1990_5_yr, col="red", type="o")

# The Forecasted Values
lines(maxtemp_ses_post_1990_5_yr$mean, col="green", type="o")

legend("topleft", lty=1, col=c("blue", "red", "green"), c("Predicted", "Fitted", "5 Year Forecast"), pch=1)

# https://robjhyndman.com/talks/MelbourneRUG.pdf   On Page 80  mentions AICc
#
# https://www.rdocumentation.org/packages/MuMIn/versions/1.40.0/topics/AICc
# 
# https://www.rdocumentation.org/packages/AICcmodavg/versions/2.1-1
# https://www.rdocumentation.org/packages/AICcmodavg/versions/2.1-1/topics/AICc
#
# https://stats.stackexchange.com/questions/19542/how-do-i-get-the-aic-value-out-from-a-forecast-object-in-r

# I have NO idea what this is actually doing, but it gives me a value....
#
aic_fit_maxtemp_ses_post_1990_5_yr <- AICc(ets(fit_maxtemp_ses_post_1990_5_yr))
aic_fit_maxtemp_ses_post_1990_5_yr
