- view: r_models
  sql_table_name: public.R_models
  fields:

  - dimension: deploy_time
    sql: ${TABLE}.deploy_time

  - dimension: description
    sql: ${TABLE}.description

  - dimension: model
    sql: ${TABLE}.model

  - dimension: model_type
    sql: ${TABLE}.model_type

  - dimension: owner
    sql: ${TABLE}.owner

  - dimension: size
    type: number
    sql: ${TABLE}.size

  - measure: count
    type: count
    drill_fields: []