ui <- page_navbar(
  title = "Dummy App",
  theme = app_theme,
  nav_spacer(),
  # Home tab
  nav_panel(
    "Home",
    layout_sidebar(
      sidebar = sidebar(
        h4("Controls")
      ),
      main = mainPanel(
        h3("Main Output"),
        card(
          card_header("About This App"),
          card_body(
            "This is a dummy Shiny app using bslib. It demonstrates a full UI layout with theming and components."
          )
        )
      )
    )
  ),

  # Upload tab
  nav_panel(
    "Upload",
    layout_column_wrap(
      width = 1 / 2,
      card(
        card_header("About This App"),
        card_body(
          "This is a dummy Shiny app using bslib. It demonstrates a full UI layout with theming and components."
        )
      )
    )
  ),

  # Settings tab
  nav_panel(
    "Settings",
    layout_column_wrap(
      width = 1 / 2,
      card(
        card_header("About This App"),
        card_body(
          "This is a dummy Shiny app using bslib. It demonstrates a full UI layout with theming and components."
        )
      )
    )
  ),

  # About tab
  nav_panel(
    "About",
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
