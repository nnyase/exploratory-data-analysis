library(dplyr)
library(ggplot2)
library(shiny)
# setwd('~/Desktop/MSc Data Science/exploratory-data-analysis/Week 3')
load("country-population21.rda")

ui <- fluidPage(
    titlePanel("Population Explosion"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                inputId = "country",
                label = "Country",
                choices = country,
                selected ='ZAF'
            )
        ),
        mainPanel(
            plotOutput("plot")
        )
    )

)
server <- function(input, output) {
    output$plot <- renderPlot({
        data <- populations %>% filter(code == input$country)
        ggplot(data, aes(x = year, y = population)) + geom_point()
    })
}

shinyApp(ui = ui, server = server)
