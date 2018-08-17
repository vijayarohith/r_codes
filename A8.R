## Assignment shiny
library(shiny)
library(dplyr)
dta<- read.csv("/home/rohy/r_scripts/app2data.csv")
View(dta)

## Code
choices1<-c("ALL",as.character((unique(dta$manufacturer))))
choices2<-c("ALL",as.character((unique(dta$trans))))
choices3<-c("ALL",as.numeric((unique(dta$cyl))))
ui <- fluidPage(
  fluidRow( headerPanel("Basic Data Table")),
  fluidRow(column(3,selectInput(inputId = "in1", label = "Manufacturer", choices = choices1, selected = "ALL")),
           column(4,selectInput(inputId = "in2", label = "Transmission", choices = choices2, selected = "ALL")),
           column(5,selectInput(inputId = "in3", label = "Cylinders", choices = choices3, selected = "ALL")) 
           ),
  tableOutput(outputId = "ot1")
)

server <- function(input, output) {
  output$ot1<-(renderTable(filter(dta, (if(input$in1 == "ALL"){manufacturer %in% as.character(choices1[-1])}  else {manufacturer == as.character(input$in1)}) & 
                                    (if(input$in2 == "ALL") {trans %in% as.character(choices2[-1])} else {trans == as.character(input$in2)}) &
                                    (if(input$in3 == "ALL") {cyl %in% as.numeric(choice3[-1])} else { cyl == as.numeric(input$in3)}))
               ))

}

shinyApp(ui = ui, server = server)


