# setwd("app/")
# getwd()
# source: ----------------------------------

# source libraries
source("dependencies.R")

# source functions and classes
source("funcs/data_funcs/dm_funcs.R")
source("funcs/classes/db_class.R")

# source modules
source("modules/main_mod.R")
source("modules/tab_db_mod.R")
source("modules/tab_reports_mod.R")
source("modules/nav_theme_mod.R")
source("modules/db_products_mod.R")
source("modules/add_products_mod.R")

# create variables: ----------------------------------
get_iris_data_sql <- rs_read_query(
  filepath = "data/sql/get_iris_data.sql",
  method = "db_get_query"
)

app_theme <- bs_theme(
  version = 5,
  brand = "configs/_brand.yml"
)

main_db_path <- "data/sku_management.db"
