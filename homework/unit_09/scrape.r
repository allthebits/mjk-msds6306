## @knitr scrape
    url <- "http://www.espn.com/nba/team/stats/_/name/sa/san-antonio-spurs"
    html <- htmlParse(url, asText=FALSE)
    
    xpath <- "//table[*//text()='SHOOTING STATISTICS']//tr[contains(@class,'player')]"
    rows <- getNodeSet(html, xpath)
    
    getEachRow = function(x) {
      c_row <- xmlChildren(x)
      row <- as.character(sapply(c_row, xmlValue))
    }
    fixColumn = function(x) {
      newrow <- as.numeric(x)
      if (sum(is.na(newrow)) > 0) {
        newrow <- x
      }
      newrow
    }
    