mod_database_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    tagList(icon("database"), "Database"),
    card(
      height = 400,
      full_screen = TRUE,
      card_header("Database Operations"),
      layout_sidebar(
        fillable = TRUE,
        sidebar = sidebar(
          # Sidebar navigation with icons
          radioButtons(
            "item",
            "Choose",
            c("One", "Two", "Three"),
            selected = "One",
            inline = FALSE
          )
        ),
        main = navset_hidden(
          id = ns("db_navset"),
          nav_panel(ns("One"), p("First tab content.")),
          nav_panel(ns("Two"), p("Second tab content.")),
          nav_panel(ns("Three"), p("Third tab content."))
        )
      )
    )
  )
}

mod_database_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observe(nav_select(ns("db_navset"), input$item))
    # Add server logic here
  })
}
