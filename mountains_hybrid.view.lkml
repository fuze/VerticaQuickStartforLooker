view: mountains_hybrid {
  sql_table_name: public.mountains_hybrid ;;

  dimension: __raw__ {
    sql: ${TABLE}.__raw__ ;;
  }

  dimension: hike_safety {
    type: number
    sql: ${TABLE}.hike_safety ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
