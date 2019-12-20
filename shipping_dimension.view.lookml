- view: shipping_dimension
  sql_table_name: public.shipping_dimension
  fields:

  - dimension: ship_carrier
    sql: ${TABLE}.ship_carrier

  - dimension: ship_mode
    sql: ${TABLE}.ship_mode

  - dimension: ship_type
    sql: ${TABLE}.ship_type

  - dimension: shipping_key
    type: number
    sql: ${TABLE}.shipping_key
    primary_key: true
    
  - measure: count
    type: count
    drill_fields: []

