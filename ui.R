# This is the user-interface definition of a Shiny web application.

shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Effect of Vitamin C on Tooth Growth in Guinea Pigs"),
  
  #space
  br(),
  br(),
  
  # Sidebar with options checkboxs
  sidebarLayout(
    sidebarPanel(
     # selectInput("dose", label = h4("Dose Value"), choices = list("0.5", "1" ,"2")),
      
      #checkbox dose
      checkboxGroupInput("checkGroup_dose", label = h4("Select Dose Value"), 
                         choices = list("0.5" = "0.5", "1" = "1", "2" = "2"),
                         selected = 0.5),
      
      #checkbox Supplement type
      checkboxGroupInput("checkGroup_supp", label = h4("Select Supplement type"), 
                         choices = list("Orange juice" = "OJ", "Ascorbic acid" = "VC"),
                         selected = "OJ"),
      
      #silder for tooth length
      # sliderInput("slider_tooth_len", label = h3("Tooth length Range"), min = min(ToothGrowth$len), 
      #             max = max(ToothGrowth$len), value = c(10, 20))
    ),
    
    # Show a plot and summary table
    mainPanel(
      plotOutput("dose_supp_Plot"),
      br(),
      
      h4("Dataset summary:"),
      h5("This table summarise the dataset. It shows the maximum, minimum and mean of teeth length for each Supplement type."),
      h4(tableOutput("summary"))
    )
  )
))