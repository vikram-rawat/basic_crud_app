# setwd("app/")
# getwd()
# source: ----------------------------------

# source libraries
source("app/dependencies.R")

# source functions and classes
source("app/funcs/data_funcs/dm_funcs.R")
source("app/funcs/classes/db_class.R")

# source modules
source("app/modules/main_mod.R")
source("app/modules/tab_db_mod.R")
source("app/modules/tab_reports_mod.R")
source("app/modules/nav_theme_mod.R")

# create variables: ----------------------------------
get_iris_data_sql <- rs_read_query(
  filepath = "app/data/sql/get_iris_data.sql",
  method = "db_get_query"
)

app_theme <- bs_theme(
  version = 5,
  brand = "_brand.yml"
)

main_db_path <- "app/data/sku_management.db"
