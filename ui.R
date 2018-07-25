#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Developing Data Products Project"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h5("This application will show you a tree plot and tell you the species depending on the value below "),
      h4("Enter flower information"),
      textInput("SepalLength", "Enter Sepal Length :", value = 5.1),
      textInput("SepalWidth", "Enter Sepal Width :", value = 3.5),
      textInput("PetalLength", "Enter Petal Length :", value = 1.4),
      textInput("PetalWidth", "Enter Petal Width :", value = 0.2),
      h4("nsplit is divided by 0.44"),
      sliderInput("cpslider", "Slide to adjust cp value", 0, 0.5, 0.25)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Classify Iris Species by cp value"),
       plotOutput("treePlot"),
       h3("Predict Species :"),
       h4("1 : setose 2 : versicolor 3 : virginica"),
       textOutput("Prediction")
    )
  )
))
