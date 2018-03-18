## @knitr q01_a

rda_file <- "data/N-MHSS-2015-DS0001-data/N-MHSS-2015-DS0001-data-r.rda"
varname <- "mh2015_puf"

if (! exists("mh2015_puf")) {
    sprintf("Loading dataframe %s from file %s.", varname, rda_file)
    load(file = rda_file)
}

