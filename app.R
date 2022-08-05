install.packages("shiny")
library(shiny)

library(datasets)

#pick the ToothGrowth dataset
data("ToothGrowth")

#explore it
?ToothGrowth

head(ToothGrowth)


#user interface variable  
ui <- ui.R

#server variable holder
server <- server.R

#calling shinyapp function
shinyApp(ui = ui, server = server)


