view: foo {
  sql_table_name: public.foo ;;

  dimension: dt {
    sql: ${TABLE}.dt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
