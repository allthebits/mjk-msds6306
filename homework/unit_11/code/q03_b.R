## @knitr q03_b

gregorovitch$Year <- as.Date(gregorovitch$SYear, "%m/%d/%Y")
# gregorovitch[c("SYear")] <- list(NULL)

ollivander$Year <- as.Date(ollivander$SYear, "%m/%d/%Y")
# ollivander[c("SYear")] <- list(NULL)