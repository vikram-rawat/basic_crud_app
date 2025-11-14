mod_database_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    tagList(icon("database"), "Database"),
    card(
      height = 300,
      full_screen = TRUE,
      card_header("Database Operations"),
      layout_sidebar(
        fillable = TRUE,
        sidebar = sidebar(
          navset_pill_list(
            widths = c(12, 12),
            nav_panel(title = "One", p("First tab content.")),
            nav_panel(title = "Two", p("Second tab content.")),
            nav_panel(title = "Three", p("Third tab content")),
            nav_spacer()
          )
        ),
        card_body(
          p("This is the database tab content.")
        )
      )
    )
  )
}

mod_database_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add server logic here
  })
}
