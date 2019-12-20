view: person {
  sql_table_name: public.Person ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    sql: ${TABLE}.address ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: surname {
    sql: ${TABLE}.surname ;;
  }

  measure: count {
    type: count
    drill_fields: [id, surname, name]
  }
}
