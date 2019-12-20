view: all_types {
  sql_table_name: public.ALL_TYPES ;;

  dimension: this_float {
    type: number
    sql: ${TABLE}.THIS_FLOAT ;;
  }

  dimension: this_int {
    type: number
    sql: ${TABLE}.THIS_INT ;;
  }

  dimension: this_string {
    sql: ${TABLE}.THIS_STRING ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
