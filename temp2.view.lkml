view: temp2 {
  sql_table_name: public.temp2 ;;

  dimension: fico_range_high {
    type: number
    sql: ${TABLE}.fico_range_high ;;
  }

  dimension: is_bad {
    type: number
    sql: ${TABLE}.is_bad ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
