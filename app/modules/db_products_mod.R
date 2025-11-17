# --- UI Module ---
mod_products_ui <- function(id) {
  ns <- NS(id)

  card(
    card_body(
      # Use input_panel for grouped form styling
      accordion(
        open = TRUE,
        accordion_panel(
          title = "Add New Product",
          ## icon for Add +
          icon = icon("plus-circle"),
          add_products_ui(ns("add_products"))
        )
      )
    )
  )
}

# --- Server Module ---
mod_products_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    add_products_server("add_products")
  })
}
