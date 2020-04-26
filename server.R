
function(input, output) {
  
  # Generation profile plot #1 
  output$start_plot = renderPlot({
    electricity %>%
      filter(YEAR == input$start_yr, STATE == input$start_state) %>%
      group_by(YEAR, STATE) %>%   
      ggplot(., aes(x = reorder(SOURCE, GENERATION), y = GENERATION)) + geom_col(aes(fill = SOURCE)) + #fill = 'lightblue') + ... => alternative
      theme(text = element_text(size = 15, face = 'bold')) + 
      xlab('Source') + 
      ylab('Electricity (GWh)') + 
      theme(axis.text.x=element_text(angle = -45, vjust = 0.5)) + 
      ggtitle('State 1: Generation Profile') + theme(plot.title = element_text(face = 'bold', size = 23))   

  })    
  
  # Generation profile plot #2  
  output$end_plot = renderPlot({ 
    electricity %>%
      filter(YEAR == input$end_yr, STATE == input$end_state) %>%
      group_by(YEAR, STATE) %>%  
      ggplot(., aes(x = reorder(SOURCE, GENERATION), y = GENERATION)) + geom_col(aes(fill = SOURCE)) + #fill = 'lightgreen') + ... => alternative
      theme(text = element_text(size = 15, face = 'bold')) + 
      xlab('Source') + 
      ylab('Electricity (GWh)') + 
      theme(axis.text.x=element_text(angle = -45, vjust = 0.5)) + 
      ggtitle('State 2: Generation Profile') + theme(plot.title = element_text(face = 'bold', size = 23))        
    
  })  
  
  # Relative source plot #1  
  output$start_plot_pct = renderPlot({ 
    electricity %>%
      filter(YEAR == input$start_yr, STATE == input$start_state) %>%
      group_by(YEAR, STATE) %>%  
      
      filter(SOURCE != 'Total') %>% 
      ggplot(aes(x = STATE, y = GENERATION, fill = SOURCE)) + geom_col(position = 'fill') + 
      theme(text = element_text(size = 15, face = 'bold')) + 
      xlab('State') +   
      ylab('Ratio') +    
      ggtitle('State 1: Source Ratio') + theme(plot.title = element_text(face = 'bold', size = 23))  
    
  })  
  
  # Relative source plot #2 
  output$end_plot_pct = renderPlot({ 
    electricity %>%
      filter(YEAR == input$end_yr, STATE == input$end_state) %>%
      group_by(YEAR, STATE) %>%  
      
      filter(SOURCE != 'Total') %>% 
      ggplot(aes(x = STATE, y = GENERATION, fill = SOURCE)) + geom_col(position = 'fill') + 
      theme(text = element_text(size = 15, face = 'bold')) + 
      xlab('State') +  
      ylab('Ratio') + 
      ggtitle('State 2: Source Ratio') + theme(plot.title = element_text(face = 'bold', size = 23))
      
  })  
  
}





