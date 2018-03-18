## @knitr q01_b

#   Get the unique list
#   Convert to character from Factor
#   Make sure the list is sorted
getStates <- function(the_vector){
    states <- sort( as.character( unique(the_vector) ) )
#   Trim leading and trailing whitespace
    states <- lapply(states, trimws)
}
    
states <- getStates(mh2015_puf$LST)
head(states, 5)
tail(states, 5)
length(states)

