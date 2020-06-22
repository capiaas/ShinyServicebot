library(shiny)
library(shinyservicebot)

# init servicebot pr user login
shinyservicebot::init(dev_mode = TRUE)
# Config
servicebot_config = list(
  servicebot_id =  "E0OQN0P0Dort", # // LIVE & TEST MODE IDs ARE DIFFERENT
  service =   "Flat Subscription",
  tier = "Pro",
  interval = "month",
  options = list(
    card = list(
      hideAddress = TRUE,
      hideCountryPostal = TRUE
    ),
    i18n  = list(
      defaultLng = "en"
    )
  ),
   type = "signup"
)

# UI ----
ui <- fluidPage(
  # App title ----
  titlePanel("SERVICEBOT SIGNUP PAGE"),
  htmltools::h2(htmltools::a("<click here to see all available options>", href = "https://dashboard.servicebot.io/examples/signup-embed/0")),
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
