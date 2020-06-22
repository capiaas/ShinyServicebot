e <- new.env()

#' INIT SERVICEBOT
#'
#' @param servicebot_secret      'Servicebot servicebot_secret'
#' @param secure_setup           'HMAC string to be generated in embeds
#' @param dev_mode               'Debug mode'
#'
#' @export
init <- function(
  servicebot_secret    = NULL,
  secure_setup         = FALSE,
  dev_mode             = FALSE    # Set dev mode
  ) {

  # Init environment
  e$servicebot_secret    <- servicebot_secret
  e$secure_setup         <- secure_setup
  e$dev_mode             <- dev_mode

  # init embed settings if emty
  if( !is.logical(dev_mode)){
    stop("servicebot: dev_mode must be 'TRUE' or 'FALSE'", call. = FALSE)
  }
  if( is.null(servicebot_secret) && !isTRUE(dev_mode)){
    stop("servicebot: Missing servicebot_secret", call. = FALSE)
  }
  if( !is.null(servicebot_secret) ){
    if (!is.character(servicebot_secret)) {
      stop("servicebot: 'servicebot_secret' must be a string", call. = FALSE)
    }
  }
  if( !is.logical(secure_setup)){
    stop("servicebot: secure_setup must be 'TRUE' or 'FALSE'", call. = FALSE)
  }
}

