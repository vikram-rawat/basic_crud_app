# setwd("app/")
# getwd()
# source: ----------------------------------
source("app/dependencies.R")
source("app/funcs/data_funcs/dm_funcs.R")
source("app/funcs/classes/db_class.R")
# create variables: ----------------------------------
sqlite_db <- sqlite_mng("app/data/dummy_data.db") |>
  db_connect()

get_iris_data_sql <- rs_read_query(
  filepath = "app/data/sql/get_iris_data.sql",
  method = "db_get_query"
)

app_theme <- bs_theme(
  version = 5,
  bootswatch = "minty",
  primary = "#007BFF",
  font_scale = 1.1
)
