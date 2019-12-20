- view: users
  sql_table_name: public.USERS
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension: age
    type: number
    sql: ${TABLE}.AGE

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CREATED_AT

  - dimension: name
    sql: ${TABLE}.NAME

  - measure: count
    type: count
    drill_fields: [id, name, orders.count]