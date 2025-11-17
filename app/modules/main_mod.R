main_ui <- function(id) {
  ns <- NS(id)

  page_navbar(
    title = "SKU management System",
    theme = app_theme,

    nav_spacer(),

    mod_database_ui(ns("db")),
    mod_reports_ui(ns("rep")),
    nav_icon_ui(ns("nav_icon"))
  )
}

# Server
main_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    session$onSessionEnded(
      function() {
        session$userData$sqlite_db |>
          db_disconnect()
      }
    )

    session$userData$sqlite_db <- sqlite_mng(global_configs$main_db_path) |>
      db_connect()

    mod_database_server("db")
    mod_reports_server("rep")
  })
}
