## @knitr q02_b

# Add Character versions of the State field
# Looks like Factors are unique across 2 different Dataframe even 
#   though byte for byte they are equal
#
statesize$STATE <- trimws(as.character(statesize$Abbrev))
mh2015_filtered$STATE <- trimws(as.character(mh2015_filtered$LST))

# Merge
mh2015_merge <- merge(mh2015_filtered, statesize, by="STATE")

# Cross Validation#
cnt_orig <- nrow(mh2015_filtered)
cnt_merge <- nrow(mh2015_merge)
merge_fact <- cnt_merge / cnt_orig

sprintf("Second Merge:  %d rows in Original DF, %d rows in Merged DF, Merged DF increased by factor of %.3f", cnt_orig, cnt_merge, merge_fact)

# Find out why we "lost" some data
unique_states <- unique(statesize$STATE)

missing <- filter(mh2015_filtered, !(STATE %in% unique_states))

sprintf("Here are the states contained in the dataframe from #1c, but not contained in the dataframe statesize")
unique(missing$STATE)

