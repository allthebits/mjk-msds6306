## @knitr q02_d
    
    # Select unique by State, Region and HospitalPer_1k_Miles
    agg <- distinct(mh2015_merge, STATE, Region, HospitalPer_1k_Miles)
    agg$Color <- 0
    
    # get the Unique Regions
    regions <- as.character( unique(agg$Region) )
    # get a Unique Color for Each Region
    uniq_colors = rainbow(length(regions), s=.6, v=.9)
    # Create a DF to match up with agg
    colors <- data.frame(regions, uniq_colors)
    colnames(colors) <- c("Region", "Color")
    
    # Empty colors list for the plot
    # colors <- vector("list", length = nrow(agg))
    
    for (rowcnt in 1:nrow(agg)) {
        colorIndex <- which(colors$Region == agg[rowcnt,]$Region)
        agg[rowcnt,]$Color <- colors[colorIndex,]$Color
    }
    
    #colors$Color
    q02_d_plot <- ggplot(data=agg, aes(x= reorder(STATE, -HospitalPer_1k_Miles), y=HospitalPer_1k_Miles)) +
         geom_col(fill=agg$Color) +
         #theme_minimal() + 
         theme(plot.title = element_text(hjust=0.5)) +
         theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
         labs(title="Mental Health Clinics - Count by Number of Hospitals per 1000 Square Miles") + 
         labs(x="State", y="Number Hospitals per 1000 Square Miles") + 
         scale_x_discrete(expand = c(0.01,0))
    
    grid::grid.draw(q02_d_plot)

