
library(plumber)
library(jsonlite)

custom_json <- function(){
  function(val, req, res, errorHandler){
    tryCatch({
      json <- jsonlite::toJSON(val, auto_unbox = TRUE)
      
      res$setHeader("Content-Type", "application/json")
      res$body <- json
      
      return(res$toResponse())
    }, error = function(e){
      errorHandler(req, res, e)
    })
  }
}

register_serializer("custom_json", custom_json)
# Make sure you put the path to your blockchain-node-server.R script

plumb('src/tars_node.R') %>%
  pr_run(port = 8000)
