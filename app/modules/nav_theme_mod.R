nav_icon_ui <- function(id) {
  ns <- NS(id)
  nav_item(
    input_dark_mode(id = ns("dark_mode"), mode = "light")
  )
}

nav_icon_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add server logic here
  })
}
