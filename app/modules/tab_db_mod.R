mod_database_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    tagList(icon("database"), "Database"),
    navset_card_tab(
      full_screen = TRUE,
      title = "Database Operations",
      nav_panel(
        "Plotly",
        card_title("A plotly plot"),
        "plotly_widget"
      ),
      nav_panel(
        "Leaflet",
        card_title("A leaflet plot"),
        "leaflet_widget"
      )
    )
  )
}

mod_database_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observe({
      nav_select(ns("db_navset"), input$item)
    })
  })
}
