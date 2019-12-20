- dashboard: product_dashboard
  title: Product Dashboard
  layout: grid
  rows:
    - elements: [total_online_sales, total_store_sales]
      height: 190
    - elements: [online_sales_yoy_comparison, store_sales_yoy_comparison]
      height: 400
    - elements: [top_10_products_online, top_10_products_store]
      height: 400



  filters:
  - name: date
    title: "Sales period"
    type: date_filter
    default_value: 2003/01/01 to 2007/12/31
  - name: measure_type
    title: "Sales Measure"
    type: field_filter
    explore: store_sales_fact
    field: store_sales_fact.measure_type
    default_value: Sales
  - name: product_type
    title: "Product Category"
    type: field_filter
    explore: online_sales_fact
    field: product_dimension.category_description


  elements:
  - name: total_online_sales
    title: 'Total Online Sales'
    type: single_value
    model: vmart1
    explore: online_sales_fact
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.category_description
    limit: 500
    width: 6
    #height: 2

  - name: total_store_sales
    title: 'Total Store Sales'
    type: single_value
    model: vmart1
    explore: store_sales_fact
    explore: store_sales_fact
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
      product_type: product_dimension.category_description
    limit: 500
    width: 6
    #height: 2


  - name: online_sales_yoy_comparison
    title: "Online Sales Year over Year Comparison"
    type: looker_line
    model: vmart1
    explore: online_sales_fact
    dimensions: [date_dimension_sales.date_month_num, date_dimension_sales.calendar_year]
    pivots: [date_dimension_sales.calendar_year]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.category_description
    sorts: [date_dimension_sales.date_month_num]
    limit: 500
    show_null_points: true
    point_style: none
    x_axis_label: Month Number
    y_axis_labels: [Online Sales]
    stacking: ''
    x_axis_scale: auto
    colors: ['#635189','#1ea8df','#49cec1','#e9b404','#dc7350','#ed6168']
    interpolation: linear
    width: 12

  - name: store_sales_yoy_comparison
    title: "Store Sales Year over Year Comparison"
    type: looker_line
    model: vmart1
    explore: store_sales_fact
    dimensions: [date_dimension.date_month_num, date_dimension.calendar_year]
    pivots: [date_dimension.calendar_year]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
      product_type: product_dimension.category_description
    sorts: [date_dimension.date_month_num]
    limit: 500
    show_null_points: true
    point_style: none
    x_axis_label: Month Number
    y_axis_labels: [Store Sales]
    stacking: ''
    colors: ['#635189','#1ea8df','#49cec1','#e9b404','#dc7350','#ed6168']
    interpolation: linear
    width: 12

  - name: top_10_products_online
    title: "Top 10 Products in Online sales"
    type: looker_bar
    model: vmart1
    explore: online_sales_fact
    dimensions: [product_dimension.department_description]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.category_description
    sorts: [online_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
    show_null_points: true
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false

  - name: top_10_products_store
    title: "Top 10 Products in Store Sales"
    type: looker_bar
    model: vmart1
    explore: store_sales_fact
    dimensions: [product_dimension.store_department_description]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
      product_type: product_dimension.category_description
    sorts: [store_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
    show_null_points: true
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
