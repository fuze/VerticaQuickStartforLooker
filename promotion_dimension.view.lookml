- view: promotion_dimension
  sql_table_name: public.promotion_dimension
  fields:

  - dimension: ad_media_name
    sql: ${TABLE}.ad_media_name

  - dimension: ad_type
    sql: ${TABLE}.ad_type

  - dimension: coupon_type
    sql: ${TABLE}.coupon_type

  - dimension: display_provider
    sql: ${TABLE}.display_provider

  - dimension: display_type
    sql: ${TABLE}.display_type

  - dimension: price_reduction_type
    sql: ${TABLE}.price_reduction_type

  - dimension_group: promotion_begin
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.promotion_begin_date

  - dimension: promotion_cost
    type: number
    sql: ${TABLE}.promotion_cost

  - dimension_group: promotion_end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.promotion_end_date

  - dimension: promotion_key
    type: number
    sql: ${TABLE}.promotion_key
    primary_key: true
    
  - dimension: promotion_media_type
    sql: ${TABLE}.promotion_media_type

  - dimension: promotion_name
    sql: ${TABLE}.promotion_name

  - measure: count
    type: count
    drill_fields: [ad_media_name, promotion_name]

