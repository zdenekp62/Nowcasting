


ui <- dashboardPage(
  dashboardHeader(title = "Covid-19 Economic Indicator Dashboard", 
                  titleWidth = 1000),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Description", tabName = "description"),
      menuItem("Dashboard", tabName = "dashboard"),
      menuItem("Original", icon = icon("file-code-o"), 
               href = paste("https://www150.statcan.gc.ca/n1/pub/",
               "71-607-x/71-607-x2020009-eng.htm", sep=""))
    ),
    width = 100
    
    
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "description",
              h2("Introduction"),
              
              fluidRow(
              )
      ),
      
      # Second tab content
      tabItem(tabName = "dashboard",
              h2("Economic Indicators Dashboard"),
              plotlyOutput('time_series_plot')
      )
    )
  )
)