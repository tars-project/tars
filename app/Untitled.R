library(ggplot2)
library(shiny)
# library(shinydashboard)
library(shinipsum)

ui <- dashboardPage(
  header = dashboardHeader(),
  dashboardSidebar(
    sidebarMenuOutput("plotDataVHA"),
    sidebarMenuOutput("tabSelector")
  ),
  dashboardBody(tabItems(
    tabItem(tabName = "facilities",
            fluidRow(box(
              uiOutput("selectedFacilityTime")
            ))),
    tabItem(tabName = "service",
            fluidRow(box(
              uiOutput("selectedFacilityYyCases")
            )))
  ))
)

server <- function(input, session, output) {
  output$renderedSelectedFacilityTime <- renderPlot({
    random_ggplot(type = "line")
  })
  output$selectedFacilityTime <- renderUI({
    plotOutput("renderedSelectedFacilityTime")
  })
  
  output$renderedFacilityYyCases <- renderPlot({
    random_ggplot(type = "bar")
  })
  output$selectedFacilityYyCases <- renderUI({
    plotOutput("renderedFacilityYyCases")
  })
  
  output$tabSelector <- renderMenu({
    sidebarMenu(id = "test",
                menuItem(
                  text = "Chart data",
                  menuSubItem(
                    text = "Facilities",
                    tabName = "facilities",
                    selected = TRUE
                  ),
                  menuSubItem(
                    text = "Service & Specialty",
                    tabName = "service",
                    selected = FALSE
                  )
                ))
  })
  
  make_menu <- reactive({
    cat("Current submenu selected: ", input$test, "\n\n")
    
    if (req(input$test) == "facilities") {
      sidebarMenu(
        menuItem(
          text = "VHA data",
          menuSubItem(
            text = "None",
            selected = TRUE
          ),
          menuSubItem(text = "Mean")
        )
      )
    } else {
      # return an empty HTML container
      div()
    } 
  })
  
  output$plotDataVHA <- renderMenu({
    make_menu()
  })
  
}

shinyApp(ui, server)

