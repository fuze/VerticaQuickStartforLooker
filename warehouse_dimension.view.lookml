- view: warehouse_dimension
  sql_table_name: public.warehouse_dimension
  fields:

  - dimension: warehouse_address
    sql: ${TABLE}.warehouse_address

  - dimension: warehouse_city
    sql: ${TABLE}.warehouse_city

  - dimension: warehouse_key
    type: number
    sql: ${TABLE}.warehouse_key
    primary_key: true
    
  - dimension: warehouse_name
    sql: ${TABLE}.warehouse_name

  - dimension: warehouse_region
    sql: ${TABLE}.warehouse_region

  - dimension: warehouse_state
    sql: ${TABLE}.warehouse_state

  - measure: count
    type: count
    drill_fields: [warehouse_name]

