library(shiny)
# Define UI for dataset viewer application
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Motor Trend Car Road Tests Linear Regression Model Builder"),
                sidebarPanel(
                        checkboxGroupInput("predictors", "Select predictors to use in LM",
                                           c("cyl         - Number of cylinders" = "cyl",
                                             "disp        - Displacement (cu.in.)"  = "disp",
                                             "hp          - Gross horsepower" = "hp",
                                             "drat        - Rear axle ratio" = "drat",
                                             "wt          - Weight (lb/1000)" = "wt",
                                             "qsec        - 1/4 mile time" = "qsec",
                                             "vs          - V/S" = "vs",
                                             "am          - Transmission (0 = automatic, 1 = manual)" = "am",
                                             "gear        - Number of forward gears" = "gear",
                                             "carb        - Number of carburetors" = "carb")),
                        submitButton('Submit')
                ),
                mainPanel(
                        h4('Tool description'),
                        p('This is an interactive tool for linear regression model selection.'),
                        p('It operates on mtcars dataset (see more details about the dataset in \'?mtcars\').'),
                        p('The linear model is created with mpg as outcome and predictors as selected in the sidebar panel.'),
                        hr(),
                        h4('Selected Linear Model'),
                        verbatimTextOutput("modelFormula"),
                        h4('Summary'),
                        verbatimTextOutput("modelSummary"),
                        h4('Diagnostics'),
                        plotOutput('modelDiag')
                )
        )
)
