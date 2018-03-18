## @knitr q01_c

    non_mainland_states <- c('AK', 'AS', 'GU', 'HI', 'PR', 'VI')
#   States to be filtered from Dataframe
#   Convert the Factor to a Staring
#   Trim the leading and trailing whitespace from the String
#   Select only those rows not in the invalid_states list
    mh2015_filtered <- filter(mh2015_puf, ! (trimws(as.character(LST)) %in% non_mainland_states) )

    sprintf("Count of original dataset: %d, count of filtered dataset: %d", nrow(mh2015_puf), nrow(mh2015_filtered))
