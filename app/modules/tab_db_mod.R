mod_database_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    tagList(icon("database"), "Database"),
    navset_card_tab(
      full_screen = TRUE,
      title = "Database Operations",
      nav_panel(
        "Products",
        card_title("Products Data Entry"),
        mod_products_ui(ns("products"))
      ),
      nav_panel(
        "Vendors",
        card_title("Add Vendors"),
        "vendor_form"
      ),
      nav_panel(
        "Price",
        card_title("Add Rates"),
        "rate_form"
      )
    )
  )
}

mod_database_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    mod_products_server("products")
  })
}
