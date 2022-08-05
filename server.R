# This is the server logic of a Shiny web application.

library(shiny)
library(datasets)
library(tidyverse)
library(dplyr)

head(ToothGrowth)

shinyServer(function(input, output) {
  
  output$dose_supp_Plot <- renderPlot({
    
    filter_supp_dose <- ToothGrowth %>% filter(ToothGrowth$dose == input$checkGroup_dose, ToothGrowth$supp == input$checkGroup_supp)
    

    # Draw the plot using ggplot2
    plot <- ggplot(filter_supp_dose, aes(x= dose, y = len))+
      geom_point(aes(color = supp), size = 3, alpha = 1)+
      labs(x = "Dosage (mg/day)", y = "Tooth length (mm)")
    
    plot
  })
  
  output$summary <- renderTable({
    # table to summarise the dataset with filter_length
    summary_vector <- c(mean = mean(ToothGrowth$len), max = max(ToothGrowth$len), min = min(ToothGrowth$len))
    
    filter_length <- ToothGrowth %>% group_by(supp) %>% summarise_at(c("len"), list(min = min, max = max, mean = mean), na.rm = TRUE)
  })
  
})