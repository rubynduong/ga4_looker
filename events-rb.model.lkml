connection: "bq_rduong"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: events {
  label: "Events RB"
  join: events_20210131__items {
    view_label: "Events: Items"
    sql: LEFT JOIN UNNEST(${events.items}) as events_20210131__items ;;
    relationship: one_to_many
  }

  join: events_20210131__event_params {
    view_label: "Events: Event Params"
    sql: LEFT JOIN UNNEST(${events.event_params}) as events_20210131__event_params ;;
    relationship: one_to_many
  }

  join: events_20210131__user_properties {
    view_label: "Events: User Properties"
    sql: LEFT JOIN UNNEST(${events.user_properties}) as events_20210131__user_properties ;;
    relationship: one_to_many
  }
}
