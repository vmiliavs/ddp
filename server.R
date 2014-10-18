library(shiny)
data(mtcars)
shinyServer(
        function(input, output) {
                output$modelFormula <- renderPrint({
                        if (length(input$predictors) > 0) {
                                paste("mpg ~ ", 
                                      paste(input$predictors, 
                                            collapse = " + "))
                        } else {
                                "Please select at least one predictor"
                        }
                })
                model <- reactive({lm(as.formula(paste("mpg ~ ", 
                                                       paste(input$predictors, 
                                                             collapse = " + "))), 
                                      mtcars)})
                output$modelSummary <- renderPrint({
                        if (length(input$predictors) > 0) {
                                summary(model())
                        }
                })
                output$modelDiag <- renderPlot({
                        if (length(input$predictors) > 0) {
                                par(mfrow = c(2,2))
                                plot(model())
                        }
                })
        }
)
