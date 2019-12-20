- dashboard: store_sales_dashboard
  title: Store Sales Dashboard
  layout: tile
  tile_size: 100


  filters:
  - name: date
    title: "Sales period"
    type: date_filter
    default_value: 2003/01/01 to 2007/12/31
  - name: customer_type
    type: field_filter
    explore: store_sales_fact
    field: customer_dimension.customer_type
    #default_value:
  - name: measure_type
    type: field_filter
    explore: store_sales_fact
    field: store_sales_fact.measure_type
    default_value: Sales
  - name: product_type
    type: field_filter
    explore: store_sales_fact
    field: product_dimension.store_department_description


  elements:
  - name: store_total
    title: Store Sales total
    type: single_value
    model: vmart1
    explore: store_sales_fact
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
      #product_type: product_dimension.store_department_description
    sorts: [store_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
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
    font_size: medium

  - name: store_sales_overtime
    title: Store Sales Performance Overtime
    type: looker_line
    model: vmart1
    explore: store_sales_fact
    dimensions: [date_dimension.calendar_year_quarter]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [date_dimension.calendar_year_quarter]
    limit: 500
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
    point_style: none
    interpolation: linear

  - name: store_sales_by_year
    title: 'Store Sales Year over Year Comparison'
    type: looker_line
    model: vmart1
    explore: store_sales_fact
    dimensions: [date_dimension.calendar_month_number_in_year]
    pivots: [date_dimension.calendar_year]
    measures: [store_sales_fact.measure_total]
    sorts: [date_dimension.calendar_month_number_in_year]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension.date_date
      customer_type: customer_dimension.customer_type
      measure_type: store_sales_fact.measure_type
    sorts: [date_dimension.calendar_year_quarter]
    limit: 500
    width:
    height:
    legend_align:
    x_axis_label: 'Month Number'
    x_axis_datetime: true
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation:
    y_axis_combined:
    y_axis_labels:
    y_axis_min:
    y_axis_max:
    hide_points: true
    colors: ['#635189','#1ea8df','#49cec1','#e9b404','#dc7350','#ed6168']


  - name: regional_store_sales
    title: Regional Store Sales
    type: looker_geo_choropleth
    model: vmart1
    explore: store_sales_fact
    dimensions: [customer_dimension.customer_state]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ['#008000']
    loading: false

  - name: top_10_customers
    title: Top 10 Store Customers
    type: looker_bar
    model: vmart1
    explore: store_sales_fact
    dimensions: [customer_dimension.customer_name]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
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

  - name: top_10_products
    title: Top 10 Products in Store Sales
    type: table
    model: vmart1
    explore: store_sales_fact
    dimensions: [product_dimension.store_department_description]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''


  - name: promo_comparison
    title: Promotion Comparison
    type: looker_pie
    model: vmart1
    explore: store_sales_fact
    dimensions: [promotion_dimension.ad_media_name]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    show_view_names: true
    inner_radius: 40
    colors: ['#635189','#49cec1','#e9b404','#dc7350','#ed6168']


  - name: top_10_employees
    title: Top 10 Employees in Store Sales
    type: looker_bar
    model: vmart1
    explore: store_sales_fact
    dimensions: [employee_dimension.employee_full_name]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
    show_null_points: true
    show_view_names: true
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
