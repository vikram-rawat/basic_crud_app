# --- UI Module ---
mod_products_ui <- function(id) {
  ns <- NS(id)

  card(
    card_header("Add Products"),
    card_body(
      # Use input_panel for grouped form styling
      accordion(
        open = TRUE,
        accordion_panel(
          title = "Add New Product",
          ## icon for Add +
          icon = icon("plus-circle"),
          # Form inputs arranged in columns
          layout_columns(
            textInput(ns("product_name"), "Product Name"),
            textInput(ns("variant"), "Variant"),
            textInput(ns("dimensions"), "Dimensions (e.g., 10x20x5 cm)"),
            selectInput(
              ns("uom"),
              "Unit of Measurement",
              choices = c("Pieces", "Kg", "Liters", "Meters", "Boxes"),
              selected = "Pieces"
            )
          ),
          # Action buttons styled with bslib
          div(
            class = "mt-3 d-flex justify-content-end gap-2",
            actionButton(
              ns("add_product"),
              "➕ Add",
              class = "btn btn-primary"
            ),
            actionButton(
              ns("reset_form"),
              "🔄 Reset",
              class = "btn btn-secondary"
            )
          )
        )
      )
    )
  )
}

# --- Server Module ---
mod_products_server <- function(id, product_data) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$add_product, {
      new_entry <- data.frame(
        ProductName = input$product_name,
        Variant = input$variant,
        Dimensions = input$dimensions,
        UOM = input$uom,
        stringsAsFactors = FALSE
      )

      # Append to reactiveValues or database
      product_data$df <- rbind(product_data$df, new_entry)

      showNotification("✅ Product added successfully!", type = "message")
    })

    observeEvent(
      input$reset_form,
      {
        updateTextInput(session, "product_name", value = "")
        updateTextInput(session, "variant", value = "")
        updateTextInput(session, "dimensions", value = "")
        updateSelectInput(session, "uom", selected = "Pieces")
      }
    )
  })
}
