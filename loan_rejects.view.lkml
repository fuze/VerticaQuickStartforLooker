view: loan_rejects {
  sql_table_name: public.loan_rejects ;;

  dimension: amount_requested {
    type: number
    sql: ${TABLE}."Amount Requested" ;;
  }

  dimension_group: application {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}."Application Date" ;;
  }

  dimension: city {
    sql: ${TABLE}.City ;;
  }

  dimension: debttoincome_ratio {
    sql: ${TABLE}."Debt-To-Income Ratio" ;;
  }

  dimension: employment_length {
    sql: ${TABLE}."Employment Length" ;;
  }

  dimension: loan_title {
    sql: ${TABLE}."Loan Title" ;;
  }

  dimension: policy_code {
    type: number
    sql: ${TABLE}."Policy Code" ;;
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}.Risk_Score ;;
  }

  dimension: state {
    sql: ${TABLE}.State ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
