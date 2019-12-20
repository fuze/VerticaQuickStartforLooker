- view: employee_dimension
  sql_table_name: public.employee_dimension
  fields:

  - dimension: annual_salary
    type: number
    sql: ${TABLE}.annual_salary

  - dimension: courtesy_title
    sql: ${TABLE}.courtesy_title

  - dimension: employee_age
    type: number
    sql: ${TABLE}.employee_age

  - dimension: employee_city
    sql: ${TABLE}.employee_city

  - dimension: employee_first_name
    sql: ${TABLE}.employee_first_name

  - dimension: employee_gender
    sql: ${TABLE}.employee_gender

  - dimension: employee_key
    primary_key: true
    type: number
    sql: ${TABLE}.employee_key

  - dimension: employee_last_name
    sql: ${TABLE}.employee_last_name

  - dimension: employee_middle_initial
    sql: ${TABLE}.employee_middle_initial
    
  - dimension: employee_full_name
    sql: ${employee_first_name} || ' ' || IFNULL(${employee_middle_initial}, '') || ' ' || ${employee_last_name}
    
  - dimension: employee_region
    sql: ${TABLE}.employee_region

  - dimension: employee_state
    sql: ${TABLE}.employee_state

  - dimension: employee_street_address
    sql: ${TABLE}.employee_street_address

  - dimension_group: hire
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.hire_date

  - dimension: hourly_rate
    type: number
    sql: ${TABLE}.hourly_rate

  - dimension: job_title
    sql: ${TABLE}.job_title

  - dimension: reports_to
    type: number
    sql: ${TABLE}.reports_to

  - dimension: salaried_flag
    type: number
    sql: ${TABLE}.salaried_flag

  - dimension: vacation_days
    type: number
    sql: ${TABLE}.vacation_days

  - measure: count
    type: count
    drill_fields: [employee_last_name, employee_first_name]

