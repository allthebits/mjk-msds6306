# Popular baby names foor 2015, 2016
1. Raw Data
    + [2016 Dataset](https://dl.dropboxusercontent.com/spa/afq05cp80hp4ezn/downloads/public/msds-data/yob2016.txt)
        + Variable Names
            + FirstName : String
            + Gender    : Character {'M', 'F' }
            + CountWithThisName : integer
    + [2015 Dataset](https://dl.dropboxusercontent.com/spa/afq05cp80hp4ezn/downloads/public/msds-data/yob2015.txt)
        + Variable names
            + FirstName : String
            + Gender    : Character {'M', 'F' }
            + CountWithThisName : integer
1. Dataset Modifications
    + 2016
        + Client requested Observation with name ending in 3 y's to be removed
        + Stored in R Variable
            + **df**
    + 2015
        + None before merge
        + Stored in R Variable
            + **y2016**
1. Tidy dataset
    + Description: **Top 10 girl names for 2015 and 2016**
    + Merge 
        + Merge details
            + 2015 and 2016 on 'FirstName" and "Gender'
            + Only include observations where there is a match in 2015 AND 2016, drop all Observations resulting in a 'NA' in the new count fields for either dataset
        + Data Modifications (After Merge)
            + Create new 'Total' field calculated from the '.x' and '.y' Count fields resulting from merge
            + Sort descending 'Total'
        + Stored in R Variable
            + **final**
            + Additional Details
                + This contains all variables including the 'Total' variable, and sorted descending 'Total'
    + Tidy Dataset
        + Data Modifications
            + Omit boy names
            + Only take top 10 girl names
            + Drop all columns except 'FirstName' and 'Total'
        + Variable names
            + FirstName : String
            + Total     : integer (2015 + 2016 total for name)
        + Stored in R Variable
            + **top10girls**
3. R Recipe for Obtaining Tidy Dataset
    ```{r}
    dbxroot <- "https://dl.dropboxusercontent.com/spa/afq05cp80hp4ezn/downloads/public/msds-data/";
    yob2016_url <- paste(dbxroot, "yob2016.txt", sep="");
    df <- read.csv(url(yob2016_url), stringsAsFactors=FALSE, sep=";", header=FALSE);
    names(df) <- c("FirstName", "Gender", "CountWithThisName")
    
    library(stringi)

    getReversedStartsWith <- function(val, regex){
        newval <- stringi::stri_reverse(val)
        newval <- grep(regex, newval, value = TRUE)
    }
    
    # Reverse all of the firstNames that match the regex, NA or empty String returned with no match
    reversed_y <- lapply(df$FirstName, function(x){ getReversedStartsWith(x, "^yyy") })
    # Remove all of the elements that are empty
    reversed_y <- reversed_y[lapply(reversed_y,length)>0]
    # Reverse the Strings back to the original spelling
    reversed_y <- lapply(reversed_y,stringi::stri_reverse)
    reversed_y
    
    # Find the row index of the name we found
    ndx <- which(df$FirstName == reversed_y[1], arr.ind=TRUE)
    sprintf("Found name %s at row index %d", df[ndx[1],]$FirstName, ndx[1])

    # Remove the row of the name we found
    y2016 <- df[-c(ndx[1]),]
    sprintf("Rows in original dataset: %d,  Rows in dataset with name removed: %d", nrow(df), nrow(y2016))

    # Make sure this name does not exist in the new dataset
    crosscheck <- lapply(y2016$FirstName, function(x){ getReversedStartsWith(x, "^yyy") })
    crosscheck <- crosscheck[lapply(crosscheck,length)>0]
    sprintf("Crosscheck of removing name %s, size of found is: %d", df[ndx[1],]$FirstName, length(crosscheck))
    
    
    yob2015_url <- paste(dbxroot, "yob2015.txt", sep="");
    y2015 <- read.csv(url(yob2015_url), stringsAsFactors=FALSE, sep=",", header=FALSE);
    names(y2015) <- c("FirstName", "Gender", "CountWithThisName")
    head(y2015)
    str(y2015)
    
    final <- merge(y2016, y2015, all=FALSE, by=c("FirstName","Gender"))
    xcnt <- sum(is.na(final$CountWithThisName.x))
    ycnt <- sum(is.na(final$CountWithThisName.y))
    sprintf("Validation after merge: Count of NA for 2016: %d, Count of NA for 2015", xcnt, ycnt)
    
    # Re-calculate the count field
    final$Total <- final$CountWithThisName.x + final$CountWithThisName.y
    # Uncomment if you want to drop the ".x" and ".y" synthetic fields
    #final <- final[,c("FirstName","Gender","CountWithThisName")]
    str(final)
    
    final <- final[with(final, order(Total, decreasing=TRUE)), ]
    
    top10girls <- head(final[which(final$Gender == "F"),],10)
    top10girls$FirstName
    
    top10girls <- top10girls[, names(top10girls) %in% c("FirstName", "Total")]
    top10girls
    ```