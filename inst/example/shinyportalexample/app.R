library(shiny)
library(shinyservicebot)

# for live mode add servicebot secres
# shinyservicebot::init(
#   servicebot_secret    = "Your servicebot secret",
#   secure_setup         = TRUE
# )
# init servicebot pr user login
shinyservicebot::init(dev_mode = TRUE)
#Config
servicebot_config = list(
  servicebot_id =  "E0OQN0P0Dort", # // LIVE & TEST MODE IDs ARE DIFFERENT
  service =   "Flat Subscription",
  email =  "shinyservicebot36io3ejbyf1pea7g61mxki@yopmail.com",
  options = list(
    i18n  = list(defaultLng = "en") # // SET DEFAULT LANGUAGE
  )
)

# UI ----
ui <- fluidPage(
  # App title ----
  titlePanel("SERVICEBOT PORTAL PAGE"),
  htmltools::h2(htmltools::a("<click here to see all available options>", href = "https://dashboard.servicebot.io/examples/subscription-portal/0")),
  shinyservicebot::shinyservicebotOutput("servicebot")
)

# SERVER ----
server <- function(input, output) {
  output$servicebot <- shinyservicebot::renderShinyservicebot(
    shinyservicebot::shinyservicebot(servicebot_config, width = "auto")
  )
}


# Create Shiny app ----
shinyApp(ui = ui, server = server)
