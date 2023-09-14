connection: "bq_rduong"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: ga4_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ga4_data_default_datagroup

explore: events_data {
    join: events_data__items {
      view_label: "Events Data: Items"
      sql: LEFT JOIN UNNEST(${events_data.items}) as events_data__items ;;
      relationship: one_to_many
    }
    join: events_data__event_params {
      view_label: "Events Data: Event Params"
      sql: LEFT JOIN UNNEST(${events_data.event_params}) as events_data__event_params ;;
      relationship: one_to_many
    }
    join: events_data__user_properties {
      view_label: "Events Data: User Properties"
      sql: LEFT JOIN UNNEST(${events_data.user_properties}) as events_data__user_properties ;;
      relationship: one_to_many
    }
}

