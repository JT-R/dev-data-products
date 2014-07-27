library(shiny)

shinyUI(
  navbarPage("Predictive model for the volume of a tree based on the 'trees' dataset",
             tabPanel("Linear model and graph",
                      
                      sidebarLayout(
                        sidebarPanel(
                          sliderInput("n_obs",
                                      "Number of observations used for building the linear model:",
                                      min = 1,
                                      max = nrow(trees),
                                      value = nrow(trees),
                                      step = 1),
                          checkboxInput("grid","Show grid on the plot",TRUE),
                          selectInput("predictor1", "Predictor (visible on X-axis):",choices=c("Girth","Height")),
                          checkboxInput("trend","Show linear regression trend line based on the predictor chosen above"),
                          sliderInput("conf_level",
                                      "Choose the confidence level [%]:",
                                      min = 0,
                                      max = 99,
                                      value = 95,
                                      step = 1),
                          checkboxInput("conf","Show the confidence interval for the trend line")
                        ),
                        
                        mainPanel(
                          plotOutput("treePlot")
                        )
                      )
             ),
             tabPanel("Documentation",
                      mainPanel(
                        includeMarkdown("trees_model_app_description.md")
                      )
             )
            )
)
