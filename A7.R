## Loading data and libraries
data10<- read.csv("/home/rohy/r_scripts/data10.csv")
View(data10)
library(shiny)
library(dplyr)
library(ggplot2)
str(data10)


## 
ui=fluidPage(headerPanel("Sugar Content across Products and Prices"),
             sliderInput(inputId = "in1",label = "Price",min=0,max = 100,value = c(25, 40)),
             radioButtons(inputId = "in2", label = "Product Type",choices = as.character((unique(data10$Type))), selected = "Beverages"),
              selectInput(inputId = "in3",label = "Country",choices = as.character((unique(data10$Country))),selected = "CANADA"),
             plotOutput(outputId = "ot1"),
           tableOutput(outputId = "ot2")
           )

server <- function(input, output){
  output$ot1= renderPlot({
    filtered_data = filter(data10, Type == as.character(input$in2) & Country == as.character(input$in3) & Price >= as.numeric(input$in1[1]) & Price <= as.numeric(input$in1[2]))
    ggplot(filtered_data,aes(x=filtered_data$Sugar_Content))+geom_histogram(bins = 40)
  })
  output$ot2<-renderTable(filter(data10,  Type == as.character(input$in2) & Country == as.character(input$in3) & Price >= as.numeric(input$in1[1]) & Price <= as.numeric(input$in1[2])))
}

shinyApp(ui,server=server)
