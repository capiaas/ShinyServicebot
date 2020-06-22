#' Servicebot render embeds
#'
#' @description This function renders the html output for servicebot embeds
#'
#' @param servicebot_config This is the embed config for servicebot as described by servicebot.
#' See https://docs.servicebot.io/subscription-portal/subscription-management-portal/subscription-management-portal-configuration
#' for config options. See the \strong{examples} section below.
#' @param dev_mode For use in development. Set to FALSE in production
#' @param width With of html widget
#' @param height height of html widget
#' @param elementId  elementId Use an explicit element ID for the widget (rather than an
#' automatically generated one). Ignored when used in a Shiny app.
#'
#' @import htmlwidgets
#'
#' @return NULL
#'
#' @export
#'
#' @examples
#' # Init servicebot pr user login
#' shinyservicebot::init(dev_mode = TRUE)
#'
#' # Config
#' servicebot_config = list (
#'  servicebot_id =  "E0OQN0P0Dort", # // LIVE & TEST MODE IDs ARE DIFFERENT
#'  service =   "Flat Subscription",
#'  email =  "shinyservicebot36io3ejbyf1pea7g61mxki-test@yopmail.com"
#' )
#'
#' shinyservicebot::shinyservicebot(servicebot_config, width = "auto")
#' 


shinyservicebot <- function(servicebot_config = e$servicebot_config, dev_mode = e$dev_mode,
                            width = NULL, height = NULL, elementId = NULL) {

  # Validate the input data
  if ( !is.list(servicebot_config) ) {
    stop("servicebot: 'servicebot_config' must be a named list", call. = FALSE)
  }
  if ( !is.character(servicebot_config$servicebot_id) ) {
    stop("servicebot: Missing servicebot_id", call. = FALSE)
  }
  if ( !is.character(servicebot_config$service) ) {
    stop("servicebot: Missing service", call. = FALSE)
  }
  # Validate mods
  if (!isTRUE(dev_mode) && servicebot_config$type != 'pricing' ) {
    if ( !is.character( servicebot_config$email ) ) {
      stop("servicebot: Missing stripe customer email in options", call. = FALSE)
    }
    if ( !isTRUE( e$secure_setup ) ) {
      stop("servicebot: Missing secure setup hash in options. Set secure_setup = TRUE in shinyservicebot::init", call. = FALSE)
    }
    # init hmac for secure setup
    # ----------------
    servicebot_config$hash = shinyservicebot::secure_setup( servicebot_config$email, e$servicebot_secret )
    # ----------------
  }

  # forward options using opts
  opts = list(
    servicebot_config = servicebot_config,
    width = width
  )

  # create widget
  htmlwidgets::createWidget(
    name = "shinyservicebot",
    opts,
    width = width,
    height = height,
    package = "shinyservicebot",
    elementId = elementId
  )

}

#' Shiny bindings for shinyservicebot
#'
#' Output and render functions for using shinyservicebot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{"100\%"},
#'   \code{"400px"}, \code{"auto"}) or a number, which will be coerced to a
#'   string and have \code{"px"} appended.
#' @param expr An expression that generates a shinyservicebot
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name shinyservicebot-shiny
#'
#' @export
shinyservicebotOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "shinyservicebot", width, height, package = "shinyservicebot")
}

#' @rdname shinyservicebot-shiny
#' @export
renderShinyservicebot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, shinyservicebotOutput, env, quoted = TRUE)
}


#' Customize html
#'
#' @param id      Id of div element
#' @param style   Style element of html
#' @param class   Class id of div element
#' @param ...     Other params
#'
#' @export
shinyservicebot_html <- function(id, style, class, ...) {
  htmltools::tags$div(
    id =id, class = class, style = style
    # Add custom html tag
    # ---
  )
}
