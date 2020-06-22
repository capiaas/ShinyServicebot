context("shiny servicebot secure setup")

test_that("Shinyservicebot returns valid hmac", {
  expect_identical(shinyservicebot::secure_setup('test123@{gmail.com', '12345'), "a92f0aca3b31739b072f3923663cb60e4ee2475e6324d271af0135ab2d53e34a")
})
