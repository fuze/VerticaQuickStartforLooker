view: ontime {
  sql_table_name: public.ONTIME ;;

  dimension: actual_elapsed_time {
    type: number
    sql: ${TABLE}.ActualElapsedTime ;;
  }

  dimension: air_time {
    type: number
    sql: ${TABLE}.AirTime ;;
  }

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.ArrDelay ;;
  }

  dimension: arr_delay_normalized {
    type: number
    sql: ${TABLE}.ArrDelay_normalized ;;
  }

  dimension: arr_time {
    sql: ${TABLE}.ArrTime ;;
  }

  dimension: cancellation_code {
    sql: ${TABLE}.CancellationCode ;;
  }

  dimension: cancelled {
    sql: ${TABLE}.Cancelled ;;
  }

  dimension: carrier_delay {
    type: number
    sql: ${TABLE}.CarrierDelay ;;
  }

  dimension: crsarr_time {
    sql: ${TABLE}.CRSArrTime ;;
  }

  dimension: crsdep_time {
    sql: ${TABLE}.CRSDepTime ;;
  }

  dimension: crselapsed_time {
    type: number
    sql: ${TABLE}.CRSElapsedTime ;;
  }

  dimension: day_of_week {
    type: number
    sql: ${TABLE}.DayOfWeek ;;
  }

  dimension: dayof_month {
    type: number
    sql: ${TABLE}.DayofMonth ;;
  }

  dimension: dep_delay {
    sql: ${TABLE}.DepDelay ;;
  }

  dimension: dep_delay_normalized {
    sql: ${TABLE}.DepDelay_normalized ;;
  }

  dimension: dep_time {
    sql: ${TABLE}.DepTime ;;
  }

  dimension: dest {
    sql: ${TABLE}.Dest ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.Distance ;;
  }

  dimension: diverted {
    sql: ${TABLE}.Diverted ;;
  }

  dimension: flight_num {
    sql: ${TABLE}.FlightNum ;;
  }

  dimension: late_aircraoft_delay {
    type: number
    sql: ${TABLE}.LateAircraoftDelay ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }

  dimension: nasdelay {
    type: number
    sql: ${TABLE}.NASDelay ;;
  }

  dimension: origin {
    sql: ${TABLE}.Origin ;;
  }

  dimension: rowid {
    type: number
    sql: ${TABLE}.rowid ;;
  }

  dimension: security_delay {
    type: number
    sql: ${TABLE}.SecurityDelay ;;
  }

  dimension: tail_num {
    sql: ${TABLE}.TailNum ;;
  }

  dimension: taxi_in {
    type: number
    sql: ${TABLE}.TaxiIn ;;
  }

  dimension: taxi_out {
    type: number
    sql: ${TABLE}.TaxiOut ;;
  }

  dimension: unique_carrier {
    sql: ${TABLE}.UniqueCarrier ;;
  }

  dimension: weather_delay {
    type: number
    sql: ${TABLE}.WeatherDelay ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
