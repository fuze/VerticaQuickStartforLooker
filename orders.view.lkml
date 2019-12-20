view: orders {
  sql_table_name: public.ORDERS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: order_amount {
    type: number
    sql: ${TABLE}.ORDER_AMOUNT ;;
  }

  dimension: status {
    sql: ${TABLE}.STATUS ;;
  }

  dimension: user_id {
    type: number
    # hidden: true
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.name, users.id, order_items.count]
  }
}
