view: online_page_dimension {
  sql_table_name: online_sales.online_page_dimension ;;

  dimension_group: end {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  dimension: online_page_key {
    type: number
    sql: ${TABLE}.online_page_key ;;
  }

  dimension: page_description {
    sql: ${TABLE}.page_description ;;
  }

  dimension: page_number {
    type: number
    sql: ${TABLE}.page_number ;;
  }

  dimension: page_type {
    sql: ${TABLE}.page_type ;;
  }

  dimension_group: start {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
