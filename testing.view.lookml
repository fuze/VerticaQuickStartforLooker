- view: testing
  sql_table_name: public.testing
  fields:

  - dimension: borrowerfico_range_high
    type: number
    sql: ${TABLE}."borrower.fico_range_high"

  - dimension: borrowerfico_range_low
    type: number
    sql: ${TABLE}."borrower.fico_range_low"

  - dimension: borrowerinquiries_last_6mths
    type: number
    sql: ${TABLE}."borrower.inquiries_last_6mths"

  - dimension: borrowerpub_rec_bankruptcies
    type: number
    sql: ${TABLE}."borrower.pub_rec_bankruptcies"

  - dimension: borrowerrevol_utilization
    type: number
    sql: ${TABLE}."borrower.revol_utilization"

  - dimension: loansis_bad
    type: number
    sql: ${TABLE}."loans.is_bad"

  - dimension: loansis_rent
    type: number
    sql: ${TABLE}."loans.is_rent"

  - dimension: loansissue_year
    type: number
    sql: ${TABLE}."loans.issue_year"

  - measure: count
    type: count
    drill_fields: []