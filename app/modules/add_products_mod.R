add_products_ui <- function(id) {
  ns <- NS(id)
  # Form inputs arranged in columns
  tagList(
    layout_columns(
      textInput(ns("product_name"), "Product Name"),
      textInput(ns("color"), "Color"),
      textInput(ns("material"), "Material"),
      textInput(ns("dimensions"), "Dimensions (e.g., 10x20x5 cm)")
    ),
    layout_columns(
      col_widths = c(3, 9),
      layout_columns(
        selectInput(
          ns("size"),
          "Size",
          choices = global_configs$size,
          selected = global_configs$size[[2]]
        ),
        selectInput(
          ns("uom"),
          "Unit of Measurement",
          choices = global_configs$unit_of_measurement,
          selected = global_configs$unit_of_measurement[[1]]
        )
      ),
      textInput(ns("description"), "Description")
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
}

# --- Server Module ---
add_products_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(
      input$add_product,
      {
        session$userData$sqlite_db |>
          get_connection() |>
          DBI::dbBegin()

        tryCatch(
          {
            new_entry <- data.table(
              product_name = input$product_name,
              color = input$color,
              material = input$material,
              dimensions = input$dimensions,
              size = input$size,
              uom = input$uom,
              description = input$description,
              primary_key = paste0(
                input$product_name,
                "__",
                input$size,
                "__",
                input$color,
                "__",
                input$material,
                "__",
                input$dimensions
              ) |>
                stringi::stri_replace_all_fixed(" ", "_") |>
                stringi::stri_trans_tolower()
            )

            dbwrite_result <- DBI::dbWriteTable(
              conn = session$userData$sqlite_db |>
                get_connection(),
              name = "products",
              value = as.data.frame(new_entry),
              append = TRUE,
              row.names = FALSE
            )

            session$userData$sqlite_db |>
              get_connection() |>
              dbCommit()
            showNotification("✅ Product added successfully!", type = "message")
          },
          error = function(e) {
            session$userData$sqlite_db |>
              get_connection() |>
              DBI::dbRollback()
            showNotification(
              paste("❌ Error adding product:", e$message),
              type = "error"
            )
          }
        )
      }
    )

    observeEvent(
      input$reset_form,
      {
        updateTextInput(session, "product_name", value = "")
        updateTextInput(session, "color", value = "")
        updateTextInput(session, "material", value = "")
        updateTextInput(session, "dimensions", value = "")
        updateTextInput(session, "description", value = "")
        updateSelectInput(
          session,
          "uom",
          selected = global_configs$unit_of_measurement[[1]]
        )
        updateSelectInput(
          session,
          "uom",
          selected = global_configs$size[[2]]
        )
      }
    )
  })
}
