
library(shiny)
library(bs4Dash)
library(shinyWidgets)

source(here::here("app", "sidebar.R"))

## UI --------------------
ui <- dashboardPage(
  
  ## MAIN --------------------
  title = "TARS",
  fullscreen = TRUE,
  header = dashboardHeader(
    title = dashboardBrand(
      title = "TARS",
      color = "primary",
      href = "https://github.com/tars-project",
      image = "https://github.com/pcastellanoescuder/POMA/blob/master/man/figures/logo.png?raw=true"#,
    ),
    skin = "light",
    status = "white",
    border = TRUE,
    sidebarIcon = icon("bars"),
    controlbarIcon = icon("th"),
    fixed = FALSE#,
    
    ## LEFT UI
    # leftUi = tagList(
    #   dropdownMenu(
    #     badgeStatus = "info",
    #     type = "notifications",
    #     notificationItem(
    #       inputId = "triggerAction2",
    #       text = "Error!",
    #       status = "danger"
    #     )
    #   ),
    #   dropdownMenu(
    #     badgeStatus = "info",
    #     type = "tasks",
    #     taskItem(
    #       inputId = "triggerAction3",
    #       text = "My progress",
    #       color = "orange",
    #       value = 10
    #     )
    #   )
    # ),
    
    ## RIGHT UI
    # rightUi = dropdownMenu(
    #   badgeStatus = "danger",
    #   type = "messages",
    #   messageItem(
    #     inputId = "triggerAction1",
    #     message = "message 1",
    #     from = "Divad Nojnarg",
    #     image = "https://adminlte.io/themes/v3/dist/img/user3-128x128.jpg",
    #     time = "today",
    #     color = "lime"
    #   )
    # )
  ),
  
  ## SIDEBAR --------------------
  sidebar = dashboardSidebar(
    skin = "light",
    status = "primary",
    elevation = 3,
    # sidebarUserPanel(
    #   image = "https://image.flaticon.com/icons/svg/1149/1149168.svg",
    #   name = "Welcome Onboard!"
    # ),
    sidebarMenu(
      # id = "main_sidebar",
      # sidebarHeader("Header 1"),
      menuItem(
        "Home",
        tabName = "home",
        icon = icon("home")
      ),
      menuItem(
        "Contact",
        tabName = "contact",
        icon = icon("id-card")
      ),
      ## INTERACTIVE UI
      sidebarMenuOutput("specific_sidebar")
      # conditionalPanel("input.met_prot_quant",
      #                  uiOutput("MetProtQuantSidebarUI")),
      # conditionalPanel("input.met_prot_count",
      #                  uiOutput("MetProtCountSidebarUI"))
      # conditionalPanel("input.rnaseq",
      # RNAseqSidebar)
    )
  ),
  
  ## CONTROLBAR --------------------
  # controlbar = dashboardControlbar(
  #   skin = "light",
  #   pinned = FALSE,
  #   collapsed = TRUE,
  #   overlay = FALSE,
  #   controlbarMenu(
  #     id = "controlbarmenu",
  #     controlbarItem(
  #       title = "Item 1",
  #       sliderInput(
  #         inputId = "obs",
  #         label = "Number of observations:",
  #         min = 0,
  #         max = 1000,
  #         value = 500
  #       ),
  #       column(
  #         width = 12,
  #         align = "center",
  #         radioButtons(
  #           inputId = "dist",
  #           label = "Distribution type:",
  #           c(
  #             "Normal" = "norm",
  #             "Uniform" = "unif",
  #             "Log-normal" = "lnorm",
  #             "Exponential" = "exp"
  #           )
  #         )
  #       )
  #     ),
  #     controlbarItem(
  #       "Item 2",
  #       "Simple text"
  #     )
  #   )
  # ),
  
  ## FOOTER --------------------
  footer = dashboardFooter(
    left = a(
      href = "https://twitter.com/polcastellano_",
      target = "_blank", "Pol Castellano Escuder"
    ),
    right = "2022"
  ),
  
  ## BODY --------------------
  body = dashboardBody(
    tabItems(
      
      ## HOME
      tabItem(
        tabName = "home",
        fluidRow(
          
          box(
            title = "Life Sciences",
            width = 12,
            collapsed = FALSE, # wile in beta
            
            fluidRow(
              
              box(
                title = "Metabolomics and Proteomics (quantitative)",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "met_prot_quant_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              ),
              
              box(
                title = "Metabolomics and Proteomics (counts)",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "met_prot_count_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              ),
              
              box(
                title = "RNAseq",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "rnaseq_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              ),
              
              box(
                title = "Epigenomics",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "epigenomics_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              ),
              
              box(
                title = "Multi-omics integration",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "multiomics_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              ),
              
              box(
                title = "Enrichment Analysis",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "enrichment_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              )
              
              )
            ),
          
          box(
            title = "Time Series Forecasting",
            width = 12,
            collapsed = TRUE,
            
            fluidRow(
              # box(
              #   title = "Title",
              #   width = 4,
              #   collapsible = FALSE,
              #   # content here
              # )
              
            )
          ),
          
          box(
            title = "Text Mining",
            width = 12,
            collapsed = TRUE,
            
            fluidRow(
              box(
                title = "Sentiment Analysis",
                width = 4,
                collapsible = FALSE,
                helpText("Description here"),
                br(),
                actionBttn(
                  inputId = "sentiment_analysis_bttn",
                  label = "Go!",
                  size = "sm",
                  color = "primary",
                  style = "bordered"
                )
              )#,
              
              # box(
              #   title = "Sentiment Analysis",
              #   width = 4,
              #   collapsible = FALSE,
              #   # content here
              # )
              
            )
          )

        )
      ),
      
      ## CONTACT
      tabItem(
        tabName = "item2",
        box(
          title = "Card with messages",
          width = 9,
          userMessages(
            width = 12,
            status = "success",
            "Content here"
            # userMessage(
            #   author = "Alexander Pierce",
            #   date = "20 Jan 2:00 pm",
            #   image = "https://adminlte.io/themes/AdminLTE/dist/img/user1-128x128.jpg",
            #   type = "received",
            #   "Is this template really for free? That's unbelievable!"
            # ),
            # userMessage(
            #   author = "Dana Pierce",
            #   date = "21 Jan 4:00 pm",
            #   image = "https://adminlte.io/themes/AdminLTE/dist/img/user5-128x128.jpg",
            #   type = "sent",
            #   "Indeed, that's unbelievable!"
            # )
          )
        )
      )

    )
  )
)

## SERVER --------------------
server <- function(input, output, session) {

  # values <- reactiveValues(page = NULL)
  
  # observeEvent(input$met_prot_quant, {
  #   insertUI(
  #     selector = "#add",
  #     where = "afterEnd",
  #     immediate = TRUE,
  #     ui = tagList(
  #       
  #       menuItem(
  #         "XXXX",
  #         tabName = "ttt",
  #         icon = icon("home")
  #       ),
  #       menuItem(
  #         "ZZZZ",
  #         tabName = "eeee",
  #         icon = icon("id-card")
  #       )
  #     )
  #   )
  # })
  # 
  # observeEvent(!input$met_prot_quant, {
  #   removeUI(
  #     selector = "div:has(> #txt)"
  #   )
  # })
  
  # observeEvent(input$EnableButton, {
  #   enable("met_prot_quant")
  # })

  # observeEvent(input$met_prot_count, {
  #   shinyjs::disable("met_prot_quant")
  # })
  
  # output$MetProtQuantSidebarUI <- renderUI({
  #   
  #   MetProtQuantSidebar
  #   
  # })
  # 
  # output$MetProtCountSidebarUI <- renderUI({
  #   
  #   MetProtCountSidebar
  #   
  # })
  
  # observeEvent(input$go, {
  #   values$myresults <- sample(1:20, 5, T)
  # })  
  # observeEvent(input$met_prot_quant, {
  #   values$page <- NULL
  # })
  
  # output$printValues <- renderPrint({
  #   req(values$myresults)
  #   values$myresults
  # })
  
  # Take an action when button is clicked
  # observe({
  #   if (input$met_prot_quant == 0)
  #     return()
  #   isolate({
  #     MetProtQuantSidebar
  #   })
  # })
  
  
  make_menu <- reactive({
    if (req(input$met_prot_quant_bttn)) {
      # return("")
      
      MetProtQuantSidebar
      
    }
    
    else if (req(input$met_prot_count_bttn)) {
      # return("")
      
      MetProtCountSidebar
      
    } 
    
    else {
      div()
    }
  })
  
  output$specific_sidebar <- renderMenu({
    make_menu()
  })
  
  
  # Render text when button is clicked
  # output$specific_sidebar <- renderMenu({
  # 
  #   if (input$met_prot_quant_bttn) {
  #     # return("")
  # 
  #       MetProtQuantSidebar
  # 
  #   }
  # 
  #   if (input$met_prot_count_bttn) {
  #     # return("")
  # 
  #       MetProtCountSidebar
  # 
  #   }
  # })
  
  # output$specific_sidebar <- renderUI({
  #     
  #     if(input$met_prot_quant)
  #       MetProtQuantSidebar
  #     
  #     else if(input$met_prot_count)
  #       MetProtCountSidebar
  # 
  # })
  
  # uiOutput("specific_sidebar"),
  # conditionalPanel("input.met_prot_quant",
  #                  uiOutput("MetProtQuantSidebarUI")),
  # conditionalPanel("input.met_prot_count",
  #                  uiOutput("MetProtCountSidebarUI"))
  # conditionalPanel("input.rnaseq",
  # RNAseqSidebar)
  
}

## APP --------------------
shinyApp(ui = ui, server = server)

