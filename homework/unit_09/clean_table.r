## @knitr clean_table
    table <- sapply(rows, getEachRow)
    rownames(table) <- c()
    table <- t(table)
    playerStats <- as.data.frame(table, stringsAsFactors = FALSE)

    thenames <- c("playerpos", "FGM", "FGA", "FGPct", "3PM", "3PA", "3PPct", "FTM", "FTA", "FT%", "2PM", "2PA", "2PPct", "PPS", "AFGPct")
    names(playerStats) <- thenames
    playerStats <- lapply(playerStats, fixColumn)

    playerStats$player_name <- gsub("(^[^,]*),.*", "\\1", playerStats$playerpos, perl=TRUE)
    playerStats$player_pos <- gsub("[^,]*,(.*)$", "\\1", playerStats$playerpos, perl=TRUE)
    playerStats$playerpos <- NULL