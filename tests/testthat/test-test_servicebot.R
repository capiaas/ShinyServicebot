context("shiny servicebot html widget")

# init servicebot
shinyservicebot::init(dev_mode = TRUE)
# Config
servicebot_config = list(
  servicebot_id =  "E0OQN0P0Dort", # // LIVE & TEST MODE IDs ARE DIFFERENT
  service =   "Flat Subscription",
  email =  "shinyservicebot36io3ejbyf1pea7g61mxkh@yopmail.com"
)
# Widget
shinyservicebot_widget <- shinyservicebot::shinyservicebot(servicebot_config, width = "auto")

test_that("Shinyservicebot validate htmlwidget object", {
  # Assert
  expect_equal(shinyservicebot_widget$x$servicebot_config$servicebot_id, servicebot_config$servicebot_id)
  expect_equal(shinyservicebot_widget$x$servicebot_config$service, servicebot_config$service)
  expect_equal(shinyservicebot_widget$x$servicebot_config$email, servicebot_config$email)
})
