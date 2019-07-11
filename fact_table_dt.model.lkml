connection: "thelook"

# include all the views
include: "*.view"

datagroup: fact_table_dt_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

explore: user_fact_table {
  from: user_fact_table
}


persist_with: fact_table_dt_default_datagroup
