
# MetabolomicsProteomicsQuant ----------------------------------------------------------
MetabolomicsProteomicsQuantBoxUi <- function(id){
  ns <- NS(id)
 
  sidebarMenu(
    menuItem(
      "XXXX",
      tabName = ns("ttt"),
      icon = icon("home")
    ),
    menuItem(
      "ZZZZ",
      tabName = ns("eeee"),
      icon = icon("id-card")
    )
  )
}

MetabolomicsProteomicsQuantBoxServer <- function(input, output, session){
  
}



# Numeric input module ----------------------------------------------------
# 
# mod_numinput_ui <- function(id){
#   ns <- NS(id)
#   numericInput(ns("num"), "Num In", 0, 0, 10)
# }
# 
# mod_numinput_server <- function(input, output, server){
#   return(reactive({input$num}))
# }
# 
# 
# # Section module ----------------------------------------------------------
# 
# mod_section_ui <- function(id){
#   ns <- NS(id)
#   
#   mod_tabcard_ui(id = "tabcard")
#   
# }
# 
# mod_section_server <- function(input, output, session){
#   callModule(mod_tabcard_server, id = "tabcard")
# }
# 
