#' @import shiny
#' @import shinydashboard

app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    #shinythemes::shinytheme("readable"),
    navbarPage(    
      title = strong("projectLive"), selected = "About",	
      tabPanel("About",
               mod_about_page_ui("about_page_ui_1"),
               icon = icon("info-circle")),
      tabPanel("Snapshot",
               mod_summary_snapshot_ui("summary_snapshot_ui_1"),
               icon = icon("chart-area")),
      tabPanel("Publication Status",
               mod_file_status_ui("file_status_ui_1"),
               icon = icon("book-reader")),
      tabPanel("Investigator Leaderboard",
               mod_study_lead_ui("study_lead_ui_1"),
               icon = icon("user")),
      tabPanel("Study Summary",
               mod_study_summary_ui("study_summary_ui_1"),
               icon = icon("bar-chart-o")),
      # tabPanel("Analyses",
      #          mod_analysis_ui("analysis_ui"),
      #          icon = icon("bar-chart-o")),
      # tabPanel("Resources",
      #          mod_resources_page_ui("resources_page_ui_1"),
      #          icon = icon("external-link")),
      collapsible = TRUE,	inverse = TRUE,
      windowTitle = "projectLive")
  )
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = 'projectLive')
  )
  
  tags$head(
    golem::activate_js(),
    golem::favicon(),
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}
