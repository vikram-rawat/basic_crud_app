main_ui <- function(id) {
  ns <- NS(id)

  page_navbar(
    title = "Dummy App",
    theme = app_theme,

    nav_spacer(),

    mod_database_ui("db"),
    mod_reports_ui("rep"),
    nav_item(
      input_dark_mode(id = ns("dark_mode"), mode = "light")
    )
  )
}

# Server
main_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    sqlite_db <- sqlite_mng("app/data/dummy_data.db") |>
      db_connect()

    mod_database_server("db")
    mod_reports_server("rep")
  })
}
