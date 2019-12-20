- view: call_center_dimension
  sql_table_name: online_sales.call_center_dimension
  fields:

  - dimension: call_center_key
    type: number
    sql: ${TABLE}.call_center_key
    primary_key: true
    
  - dimension: cc_address
    sql: ${TABLE}.cc_address

  - dimension: cc_city
    sql: ${TABLE}.cc_city

  - dimension: cc_class
    sql: ${TABLE}.cc_class

  - dimension_group: cc_closed
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.cc_closed_date

  - dimension: cc_employees
    type: number
    sql: ${TABLE}.cc_employees

  - dimension: cc_hours
    sql: ${TABLE}.cc_hours

  - dimension: cc_manager
    sql: ${TABLE}.cc_manager

  - dimension: cc_name
    sql: ${TABLE}.cc_name

  - dimension_group: cc_open
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.cc_open_date

  - dimension: cc_region
    sql: ${TABLE}.cc_region

  - dimension: cc_state
    sql: ${TABLE}.cc_state

  - measure: count
    type: count
    drill_fields: [cc_name]

