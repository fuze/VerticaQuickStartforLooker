- view: date_dimension
  sql_table_name: public.date_dimension
  fields:

  - dimension: calendar_half_year
    type: number
    sql: ${TABLE}.calendar_half_year

  - dimension: calendar_month_name
    sql: ${TABLE}.calendar_month_name

  - dimension: calendar_month_number_in_year
    type: number
    sql: ${TABLE}.calendar_month_number_in_year

  - dimension: calendar_quarter
    type: number
    sql: ${TABLE}.calendar_quarter

  - dimension: calendar_week_number_in_year
    type: number
    sql: ${TABLE}.calendar_week_number_in_year

  - dimension: calendar_year
    type: number
    sql: ${TABLE}.calendar_year

  - dimension: calendar_year_month
    sql: ${TABLE}.calendar_year_month

  - dimension: calendar_year_quarter
    sql: ${TABLE}.calendar_year_quarter

  - dimension_group: date
    type: time
    timeframes: [date, week, month, year, month_num]
    convert_tz: false
    sql: ${TABLE}.date

  - dimension: date_key
    type: number
    primary_key: true
    sql: ${TABLE}.date_key
    hidden: true
    
  - dimension: day_number_in_calendar_month
    type: number
    sql: ${TABLE}.day_number_in_calendar_month

  - dimension: day_number_in_calendar_year
    type: number
    sql: ${TABLE}.day_number_in_calendar_year

  - dimension: day_number_in_fiscal_month
    type: number
    sql: ${TABLE}.day_number_in_fiscal_month

  - dimension: day_number_in_fiscal_year
    type: number
    sql: ${TABLE}.day_number_in_fiscal_year

  - dimension: day_of_week
    sql: ${TABLE}.day_of_week

  - dimension: full_date_description
    sql: ${TABLE}.full_date_description

  - dimension: holiday_indicator
    sql: ${TABLE}.holiday_indicator

  - dimension: last_day_in_month_indicator
    type: number
    sql: ${TABLE}.last_day_in_month_indicator

  - dimension: last_day_in_week_indicator
    type: number
    sql: ${TABLE}.last_day_in_week_indicator

  - dimension: selling_season
    sql: ${TABLE}.selling_season

  - dimension: weekday_indicator
    sql: ${TABLE}.weekday_indicator

  - measure: count
    type: count
    drill_fields: [calendar_month_name]

  