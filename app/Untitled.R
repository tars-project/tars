

### HEAD
# head_tags <- tags$head(includeHTML("gtag.html"), includeCSS("styles.css"))

### universal elements
main_title <- HTML('<a href="." style="color:black;">DATA-DRIVEN HYPOTHESIS</a>')
window_title <- "Data-Driven Hypothesis | A Hirschey Lab Resource"

ddhNavbarPage <- function(..., formContent = NULL, id = NULL) {
  nb <- navbarPage(title = main_title, id = id, windowTitle = window_title, ...)
  
  formContent <- formContent %>% tagAppendAttributes(class = 'navbar-form-panel')
  nb <- tagInsertChildren(nb, after=1, .cssSelector=".container-fluid", formContent)
  if (privateMode) {
    logout_link <- a(
      href="https://www.datadrivenhypothesis.com/logout/",
      img(class="logout-image", src="power_button32.png", width = 16, height = 16)
    )
    nb <- tagInsertChildren(nb, after=1, .cssSelector=".container-fluid", logout_link)
  }
  nb
}

### list of all pages rendered by this app
page_names <- list(
  home="home"#,
  # search="search",
  # gene="gene",
  # pathway="pathway",
  # gene_list="gene_list", 
  # cell="cell", 
  # lineage="lineage",
  # cell_list="cell_list",
  # compound="compound",
  # moa="moa",
  # metabolite="metabolite",
  # compound_list="compound_list"
)


#HOME(landing) PAGE----
homePage <- function (id) {
  ns <- NS(id)
  tagList(
    # head_tags,
    HTML('<center><br><br><img src="ddh_logo.png", width = "338" ></center>'),
    tags$div(
      tags$br(),
      HTML(paste("<center>Data-driven hypothesis is a", "VVV", "resource developed by the <a href='http://www.hirscheylab.org' style='color:black;'>Hirschey Lab</a> for predicting functional relationships for thousands of genes across the human genome.</center>")), 
      tags$br(),
      tags$br()),
    HTML("<center>")#,
    # querySearchInput(ns("search")), 
    # exampleSearchesLink(ns("examples")), 
    # ", ", 
    # browsePathwaysLink(ns("pathways")),
    # ", or",
    # getLuckyLink(ns("lucky")),
    # HTML("</center>"),
    # exampleSearchesPanel(ns("examples")),
    # browsePathwaysPanel(ns("pathways")) 
  )
}

homePageServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # querySearchServer("search")
      # getLuckyServer("lucky")
      # exampleSearchesLinkServer("examples")
      # exampleSearchesPanelServer("examples")
      # browsePathwaysLinkServer("pathways")
      # browsePathwaysPanelServer("pathways")
    }
  )
}


# PAGE MODULES-----
# source(here::here("code", "page_gene.R"), local = TRUE) ### GENE PAGE ----
# source(here::here("code", "page_cell.R"), local = TRUE) ### CELL PAGE ----
# source(here::here("code", "page_compound.R"), local = TRUE) ### COMPOUND PAGE ----

# Create output for our router in main UI of Shiny app.
ui <- shinyUI(
  fluidPage(
    uiOutput("pageUI")
  )
)

pages <- list(
  home=homePage(page_names$home)#,
  # search=searchPage(page_names$search),
  # gene=genePage(page_names$gene, subtype = "gene"),
  # pathway=genePage(page_names$pathway, subtype = "pathway"),
  # gene_list=genePage(page_names$gene_list, subtype = "gene_list"),
  # cell=cellPage(page_names$cell, subtype = "cell"),
  # lineage=cellPage(page_names$lineage, subtype = "lineage"),
  # lineage_subtype=cellPage(page_names$lineage_subtype, subtype = "lineage_subtype"),
  # cell_list=cellPage(page_names$cell_list, subtype = "cell_list"),
  # compound=compoundPage(page_names$compound, subtype = "compound"),
  # moa=compoundPage(page_names$moa, subtype = "moa"),
  # metabolite=compoundPage(page_names$metabolite, subtype ="metabolite"),
  # compound_list=compoundPage(page_names$compound_list, subtype = "compound_list")
)

server <- shinyServer(function(input, output, session) {
  options(shiny.usecairo=TRUE) # ensure high quality images
  output$pageUI <- renderUI({
    query <- getQueryString()
    show_page <- query$show
    if (is.null(show_page)) {
      show_page <- page_names$home
    }
    pages[show_page]
  })
  homePageServer(page_names$home)
  # searchPageServer(page_names$search)
  # genePageServer(page_names$gene, subtype = "gene")
  # genePageServer(page_names$pathway, subtype = "pathway")
  # genePageServer(page_names$gene_list, subtype = "gene_list")
  # cellPageServer(page_names$cell, subtype = "cell")
  # cellPageServer(page_names$lineage, subtype = "lineage")
  # cellPageServer(page_names$lineage_subtype, subtype = "lineage_subtype")
  # cellPageServer(page_names$cell_list, subtype = "cell_list")
  # compoundPageServer(page_names$compound, subtype = "compound")
  # compoundPageServer(page_names$metabolite, subtype = "metabolite")
  # compoundPageServer(page_names$moa, subtype = "moa")
  # compoundPageServer(page_names$compound_list, subtype = "compound_list")
  session$onSessionEnded(function() {
    delete_tmp_zip_directory(session)
  })
})

shinyApp(ui, server)


