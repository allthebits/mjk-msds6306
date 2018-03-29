## @knitr q02_b

# Subset the timeseries on its column name, taking only 1991 and later
# http://stat.ethz.ch/R-manual/R-devel/library/base/html/names.html
# https://www.r-bloggers.com/extracting-information-from-objects-using-names/

# This ends up being a "numeric" and not a "ts"
# mxtemp_post_1990 <- maxtemp[names(maxtemp) > "1990"]
maxtemp_post_1990 <- window(maxtemp,start=1991,end=2016)
