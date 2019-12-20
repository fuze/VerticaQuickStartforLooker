- view: store_orders_fact
  sql_table_name: store.store_orders_fact
  fields:

  - dimension_group: date_delivered
    type: time
    timeframes: [date, week, month, year, month_num]
    convert_tz: false
    sql: ${TABLE}.date_delivered

  - dimension_group: date_ordered
    type: time
    timeframes: [date, week, month, year, month_num]
    convert_tz: false
    sql: ${TABLE}.date_ordered

  - dimension_group: date_shipped
    type: time
    timeframes: [date, week, month, year, month_num]
    convert_tz: false
    sql: ${TABLE}.date_shipped

  - dimension: employee_key
    type: number
    sql: ${TABLE}.employee_key

  - dimension_group: expected_delivery
    type: time
    timeframes: [date, week, month, year, month_num]
    convert_tz: false
    sql: ${TABLE}.expected_delivery_date

  - dimension: order_number
    type: number
    sql: ${TABLE}.order_number

  - dimension: overstock_ceiling
    type: number
    sql: ${TABLE}.overstock_ceiling

  - dimension: product_key
    type: number
    sql: ${TABLE}.product_key

  - dimension: product_version
    type: number
    sql: ${TABLE}.product_version

  - dimension: quantity_delivered
    type: number
    sql: ${TABLE}.quantity_delivered

  - dimension: quantity_in_stock
    type: number
    sql: ${TABLE}.quantity_in_stock

  - dimension: quantity_ordered
    type: number
    sql: ${TABLE}.quantity_ordered

  - dimension: reorder_level
    type: number
    sql: ${TABLE}.reorder_level

  - dimension: shipper_name
    sql: ${TABLE}.shipper_name

  - dimension: shipping_cost
    type: number
    sql: ${TABLE}.shipping_cost

  - dimension: store_key
    type: number
    sql: ${TABLE}.store_key

  - dimension: total_order_cost
    type: number
    sql: ${TABLE}.total_order_cost

  - dimension: unit_price
    type: number
    sql: ${TABLE}.unit_price

  - dimension: vendor_key
    type: number
    sql: ${TABLE}.vendor_key

  - measure: count
    type: count
    drill_fields: [shipper_name]

#Perfect Order - The percentage of orders that were delivered without incidents, this will be orders with both quantity accuracy and on-time delivery. 
#An example of this in a calculation might be Perfect Order: IF (date_delivered <= expected_delivery_date) AND (quantity_delivered = quantity_ordered) THEN (1) ELSE (0) END. 
#Number of Orders: 1 for every order. The percentage of perfect orders calculation: TOTAL(Perfect Order) / TOTAL(Number of Orders)    

  
  - dimension: is_expected_delivered_date
    type: yesno
    sql: ${TABLE}.date_delivered <= ${TABLE}.expected_delivery_date

  - dimension: is_expected_quantity
    type: yesno
    sql: ${quantity_delivered} = ${quantity_ordered}

  - measure: average_quantity_ordered
    type: average
    #sql: ${TABLE}.quantity_ordered
    sql: ${quantity_ordered}
    #value_format: '$#,##0.00'

  - measure: average_quantity_delivered
    type: average
    #sql: ${TABLE}.quantity_delivered
    sql: ${quantity_delivered}
  
  - measure: average_quantity_in_stock
    type: average
    sql: ${quantity_in_stock}
  
  - measure: average_days_to_deliver
    type: number
    sql: avg(${TABLE}.date_delivered - ${TABLE}.date_ordered)
  

  - filter: measure_type
    suggestions: ["Avg Quantity Ordered", "Avg Quantity Delivered", "Avg Quantity in Stock", "Avg Days to Deliver"]

  - measure: order_measure
    type: number
    sql: |
      case
        when {% parameter measure_type %} = 'Avg Quantity Ordered' then ${average_quantity_ordered}
        when {% parameter measure_type %} = 'Avg Quantity Delivered' then ${average_quantity_delivered}
        when {% parameter measure_type %} = 'Avg Quantity in Stock' then ${average_quantity_in_stock}
        when {% parameter measure_type %} = 'Avg Days to Deliver' then ${average_days_to_deliver}
      end


  - measure: perfect_order_count
    type: count
    filter: 
      is_expected_quantity: yes
      is_expected_delivered_date: yes
    drill_fields: []
    
  - measure: perfect_order_rate
    type: number
    sql: ${perfect_order_count}/nullif(${count}, 0)
    value_format: '0.00%'
    
  - measure: perfect_quantity_count
    type: count
    filter: 
      is_expected_quantity: yes
    drill_fields: []
    
  - measure: perfect_quantity_rate
    type: number
    sql: ${perfect_quantity_count}/nullif(${count}, 0)
    value_format: '0.00%'
  
  - measure: perfect_expected_date_count
    type: count
    filter: 
      is_expected_delivered_date: yes
    drill_fields: []
    
  - measure: perfect_expected_date_rate
    type: number
    sql: ${perfect_expected_date_count}/nullif(${count}, 0)
    value_format: '0.00%'
  