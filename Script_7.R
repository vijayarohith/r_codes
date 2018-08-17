## ShinyR
library(shiny)
ui = fluidPage("This is r webpage")
server = function(input,output){}
shinyApp(ui=ui,server=server)

## define inputs
scdin = sliderInput(inputId = "slider 1", label = "marks", value = 5,min =0, max =5)
shinyApp(ui =scdin, server = server)

## action button
acb = actionButton(inputId = "ab",label = "press", width = 300, icon = icon("play-circle"))
shinyApp(ui =acb, server = server)

## check box
cb = checkboxInput(inputId = "cb", label = "checkbox", width = 500,value = F)
shinyApp(ui =cb, server = server)

## check box group
cbg = checkboxGroupInput(inputId = "cbg", label = "fruits", choices = c("apple","orange","mango"), selected = "apple")
shinyApp(ui =cbg, server = server)

## date selector
ds = dateInput(inputId = "ds",label = "dob",value = "1990-10-19", min = "1950-01-01", max = "2019-01-01")
shinyApp(ui =ds, server = server)

## upload file user interface

fil = fileInput(inputId = "fileup",label = "Select file man",multiple = F,buttonLabel = "open",placeholder = "upload file")
shinyApp(ui =fil, server = server)

## slider input

sli= sliderInput(inputId = "sli",label = "marks", min = 0, max = 100, value = 99)
shinyApp(ui =sli, server = server)

## radio button

rb = radioButtons(inputId = "rb", label = "only one", choices = c("chicken","mutton","fish"), selected = "fish")
shinyApp(ui =rb, server = server)

## image output

iop = imageOutput(outputId = "img")
shinyApp(ui =iop, server = server)

## output function
uii = fluidPage(plotOutput(outputId = "ou1"))
serverr <- function(input,output){ output$ou1<- renderPlot(plot(1:100)) }
shinyApp(ui =uii, server = serverr)

## histogram
uii = fluidPage(plotOutput(outputId = "ou1"))
serverr <- function(input,output){ output$ou1<- renderPlot(hist(iris$Sepal.Length, col= "palegreen")) }
shinyApp(ui =uii, server = serverr)

## box plot
library(ggplot2)
ggplot(iris, aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot()
uii = fluidPage(plotOutput(outputId = "ou1"))
serverr <- function(input,output){ output$ou1<- renderPlot(ggplot(iris, aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot()) }
shinyApp(ui =uii, server = serverr)

## combine input and output
ui=fluidPage(sliderInput(inputId = "sl1", label = "select",min=0,max=100,value = 50),plotOutput(outputId = "out2"))
server <- function(input,output){output$out2 = renderPlot(hist(rnorm(input$sl1), col="red"))}
shinyApp(ui =ui, server = server)



