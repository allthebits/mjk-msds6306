## @knitr q01_d

    mainland_states <- getStates(mh2015_filtered$LST)
    colors = rainbow(length(mainland_states), s=.6, v=.9)
    
    plotinfo <- data.frame(mainland_states, colors)
    

    q01_d_plot <- ggplot(data=mh2015_filtered, aes(x=LST)) +
         geom_bar(stat="count", width=0.7, fill=colors)+
         theme_minimal() + 
         theme(plot.title = element_text(hjust=0.5)) +
         theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
         labs(title="Mental Health Clinics - Count by State on Mainland United States") + 
         labs(x="State of Mental Health Clinic") + 
         labs (y="Count by State") +
         scale_x_discrete(expand = c(0.01,0)) + 
         scale_fill_manual(values=colors)

    grid::grid.draw(q01_d_plot)
