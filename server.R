#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rpart)
library(rattle)
data("iris")

# Define server logic required to draw a histogram
shinyServer(function(input, output){
  modFit <- reactive({
    cpInput <- input$cpslider
    rpart(Species ~., data = iris, control = rpart.control(cp = cpInput))
  })
  output$treePlot <- renderPlot({
    fancyRpartPlot(modFit())
  })

  modPred <- reactive({
    SepalLengthPred <- as.numeric(input$SepalLength)
    SepalWidthPred <- as.numeric(input$SepalWidth)
    PetalLengthPred <- as.numeric(input$PetalLength)
    PetalWidthPred <- as.numeric(input$PetalWidth)
    predict(modFit(), newdata = data.frame(Sepal.Length = SepalLengthPred,
                                         Sepal.Width = SepalWidthPred,
                                         Petal.Length = PetalLengthPred,
                                         Petal.Width = PetalWidthPred), type = "class")
  })
  output$Prediction <- renderText({
    modPred()
  })
})
