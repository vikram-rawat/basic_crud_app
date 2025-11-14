main_ui <- function(id) {
  ns <- NS(id)

  page_navbar(
    title = "Dummy App",
    theme = app_theme,

    nav_spacer(),

    nav_panel(
      tagList(icon("database"), "Database"),
      mod_database_ui("db")
    ),

    nav_panel(
      tagList(icon("file-alt"), "Reports"),
      mod_reports_ui("rep")
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
