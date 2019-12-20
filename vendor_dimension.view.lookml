- view: vendor_dimension
  sql_table_name: public.vendor_dimension
  fields:

  - dimension: deal_size
    type: number
    sql: ${TABLE}.deal_size

  - dimension_group: last_deal_update
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.last_deal_update

  - dimension: vendor_address
    sql: ${TABLE}.vendor_address

  - dimension: vendor_city
    sql: ${TABLE}.vendor_city

  - dimension: vendor_key
    type: number
    sql: ${TABLE}.vendor_key
    primary_key: true

  - dimension: vendor_name
    sql: ${TABLE}.vendor_name

  - dimension: vendor_region
    sql: ${TABLE}.vendor_region

  - dimension: vendor_state
    sql: ${TABLE}.vendor_state

  - measure: count
    type: count
    drill_fields: [vendor_name]

