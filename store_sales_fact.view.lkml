view: store_sales_fact {
  sql_table_name: store.store_sales_fact ;;

  dimension: cost_dollar_amount {
    type: number
    sql: ${TABLE}.cost_dollar_amount ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }

  dimension: date_key {
    type: number
    sql: ${TABLE}.date_key ;;
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
  }

  dimension: gross_profit_dollar_amount {
    type: number
    sql: ${TABLE}.gross_profit_dollar_amount ;;
  }

  dimension: pos_transaction_number {
    type: number
    sql: ${TABLE}.pos_transaction_number ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
  }

  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  dimension: promotion_key {
    type: number
    sql: ${TABLE}.promotion_key ;;
  }

  dimension: sales_dollar_amount {
    type: number
    sql: ${TABLE}.sales_dollar_amount ;;
  }

  dimension: sales_quantity {
    type: number
    sql: ${TABLE}.sales_quantity ;;
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  dimension: tender_type {
    sql: ${TABLE}.tender_type ;;
  }

  dimension: transaction_time {
    sql: ${TABLE}.transaction_time ;;
  }

  dimension: transaction_type {
    sql: ${TABLE}.transaction_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_sales {
    type: sum
    sql: ${sales_dollar_amount} ;;
    value_format: "$#,##0.00"
    drill_fields: [promotion_dimension.ad_type, total_sales]
  }

  measure: total_cost {
    type: sum
    sql: ${cost_dollar_amount} ;;
    value_format: "$#,##0.00"
  }

  measure: total_profit {
    type: sum
    sql: ${gross_profit_dollar_amount} ;;
    value_format: "$#,##0.00"
  }

  measure: total_quantity {
    type: sum
    sql: ${sales_quantity} ;;
  }

  filter: measure_type {
    suggestions: ["Cost", "Sales", "Profit", "Quantity"]
  }

  measure: measure_total {
    type: number
    sql: case
        when {% parameter measure_type %} = 'Cost' then ${total_cost}
        when {% parameter measure_type %} = 'Sales' then ${total_sales}
        when {% parameter measure_type %} = 'Profit' then ${total_profit}
        when {% parameter measure_type %} = 'Quantity' then ${total_quantity}
      end
       ;;
  }

  measure: appr_count_store {
    type: number
    sql: approximate_count_distinct(${store_key}) ;;
  }
}
