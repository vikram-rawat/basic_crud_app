# source global.R
source("global.R")

# UI
ui <- main_ui("main")

# Server
server <- function(input, output, session) {
  main_server("main")
}

shinyApp(ui, server)
