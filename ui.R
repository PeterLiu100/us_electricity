#library(shiny)

fluidPage(
  titlePanel(title = "U.S. State Electricity Generation"),
  sidebarLayout(   
    
    sidebarPanel(
      selectizeInput(inputId = "start_yr",                       # inputId = unique identifier for internal use 
                     label = "Year 1",                           # label/title for the drop box to display 
                     choices = unique(electricity[, 'YEAR'])),   # referencing the data  
      
      selectizeInput(inputId = "start_state",
                     label = "State 1",
                     choices = unique(electricity[, 'STATE'])),
      
      br(),
      br(),
      
      selectizeInput(inputId = "end_yr",
                     label = "Year 2",
                     choices = unique(electricity[, 'YEAR'])),
      
      selectizeInput(inputId = "end_state",
                     label = "State 2",
                     choices = unique(electricity[, 'STATE'])), 
      
      
      width = 2
      

    ),
    
    # assigning graphs to a row 
    mainPanel(
      fluidRow(    
        column(6, plotOutput("start_plot")),      
        column(6, plotOutput("end_plot")),  
        
        br('.'), 
        
        column(6, plotOutput("start_plot_pct")),
        column(6, plotOutput("end_plot_pct"))
      )
      
    )
  )

)







