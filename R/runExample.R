#' Run examples of using shinyservicebot in a Shiny app
#'
#' @examples
#' if (interactive()) {
#'   runPricingExample()
#' }
#' @export
runPricingExample <- function() {
  appDir <- system.file("example/shinypricingexample", package = "shinyservicebot")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `shinyservicebot`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}

#' Run examples of using shinyservicebot in a Shiny app
#'
#' @examples
#' if (interactive()) {
#'   runPortalExample()
#' }
#' @export
runPortalExample <- function() {
  appDir <- system.file("example/shinyportalexample", package = "shinyservicebot")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `shinyservicebot`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}

#' Run examples of using shinyservicebot in a Shiny app
#'
#' @examples
#' if (interactive()) {
#'   runSignupExample()
#' }
#' @export
runSignupExample <- function() {
  appDir <- system.file("example/shinysignupexample", package = "shinyservicebot")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `shinyservicebot`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
