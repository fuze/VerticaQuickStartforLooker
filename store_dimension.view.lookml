- view: store_dimension
  sql_table_name: store.store_dimension
  fields:

  - dimension: annual_shrinkage
    type: number
    sql: ${TABLE}.annual_shrinkage

  - dimension: financial_service_type
    sql: ${TABLE}.financial_service_type

  - dimension_group: first_open
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.first_open_date

  - dimension: floor_plan_type
    sql: ${TABLE}.floor_plan_type

  - dimension: foot_traffic
    type: number
    sql: ${TABLE}.foot_traffic

  - dimension_group: last_remodel
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.last_remodel_date

  - dimension: monthly_rent_cost
    type: number
    sql: ${TABLE}.monthly_rent_cost

  - dimension: number_of_employees
    type: number
    sql: ${TABLE}.number_of_employees

  - dimension: photo_processing_type
    sql: ${TABLE}.photo_processing_type

  - dimension: selling_square_footage
    type: number
    sql: ${TABLE}.selling_square_footage

  - dimension: store_address
    sql: ${TABLE}.store_address

  - dimension: store_city
    sql: ${TABLE}.store_city

  - dimension: store_key
    type: number
    sql: ${TABLE}.store_key
    primary_key: true
    
  - dimension: store_name
    sql: ${TABLE}.store_name

  - dimension: store_number
    type: number
    sql: ${TABLE}.store_number

  - dimension: store_region
    sql: ${TABLE}.store_region

  - dimension: store_state
    sql: ${TABLE}.store_state

  - dimension: total_square_footage
    type: number
    sql: ${TABLE}.total_square_footage

  - measure: count
    type: count
    drill_fields: [store_name]

