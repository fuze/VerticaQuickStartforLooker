view: iris {
  sql_table_name: public.iris ;;

  dimension: pl {
    type: number
    sql: ${TABLE}.pl ;;
  }

  dimension: pw {
    type: number
    sql: ${TABLE}.pw ;;
  }

  dimension: sl {
    type: number
    sql: ${TABLE}.sl ;;
  }

  dimension: spec {
    sql: ${TABLE}.spec ;;
  }

  dimension: sw {
    type: number
    sql: ${TABLE}.sw ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
