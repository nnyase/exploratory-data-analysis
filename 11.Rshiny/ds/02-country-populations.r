library(dplyr)
library(ggplot2)
library(shiny)

load("country-population21.rda")

ui <- fluidPage(
    titlePanel("Population Explosion"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                inputId = "country",
                label = "Country",
                choices = country,
                selected = "ZAF"
            ),
            sliderInput("size",
                        label = h3('point size'),
                        min = 0,
                        max=5,
                        value =1
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
        ggplot(data, aes(x = year, y = population)) 
    })
}

shinyApp(ui = ui, server = server)