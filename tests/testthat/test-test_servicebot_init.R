context("shiny servicebot init")

test_that("Shinyservicebot init errors when given a unvalid config servicebot_secret", {
  expect_error(shinyservicebot::init(), "servicebot: Missing servicebot_secret")
})

test_that("Shinyservicebot init errors when given a unvalid config servicebot_secret", {
  expect_error(shinyservicebot::init(servicebot_secret = TRUE), "servicebot: 'servicebot_secret' must be a string")
})

test_that("Shinyservicebot init errors when given a unvalid config secure_setup", {
  expect_error(shinyservicebot::init(secure_setup = "TEST", dev_mode = TRUE), "servicebot: secure_setup must be 'TRUE' or 'FALSE'")
})

test_that("Shinyservicebot init errors when given a unvalid config dev_mode", {
  expect_error(shinyservicebot::init(secure_setup = FALSE, dev_mode = "FALSE"), "servicebot: dev_mode must be 'TRUE' or 'FALSE'")
})
