## @knitr plot
    colors <- c("red", "orange", "yellow", "cyan", "green", "blue", "purple", "darkgrey" , "turquoise", "black" )
    
    color_dict <- list()
    unique_pos <- unique(playerStats$player_pos)
    for (ndx in 1:length(unique_pos)) {
        color_dict[[ unique_pos[ndx] ]] <- colors[ndx]
    }
    
    the_colors <- lapply(playerStats$player_pos, function(x) color_dict[[x]] )
    the_colors <- as.character(the_colors)
    
    plplt <- barplot(playerStats$FGPct, main="Field Goal Percentage by Game\nColor Coded by Position", ylab = "Percentage", 
            cex.lab = .9, cex.main = .9, cex.names = .6, beside=TRUE, col=the_colors)
    text(plplt, par("usr")[3] - 0.025, srt = 45, adj = 1, labels = playerStats$player_name, xpd = TRUE, font = 1)