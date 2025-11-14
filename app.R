ui <- page_navbar(
  title = "Dummy App",
  theme = app_theme,
  nav_spacer(),
  # Home tab
  nav_panel(
    "DataBase",
    layout_column_wrap(
      width = 1,
      card(
        card_header("About This App"),
        card_body(
          "This is a dummy Shiny app using bslib. It demonstrates a full UI layout with theming and components."
        )
      )
    )
  ),

  # Upload tab
  nav_panel(
    "Reports",
    layout_column_wrap(
      width = 1,
      card(
        card_header("About This App"),
        card_body(
          "This is a dummy Shiny app using bslib. It demonstrates a full UI layout with theming and components."
        )
      )
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
