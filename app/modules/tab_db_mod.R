mod_database_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    tagList(icon("database"), "Database"),

    layout_column_wrap(
      width = 1,
      card(
        card_header("Database Module"),
        card_body("This is the database tab content.")
      )
    )
  )
}

mod_database_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add server logic here
  })
}
