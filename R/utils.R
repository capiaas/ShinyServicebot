#' Generate JWT
#' @import digest
#' @param email Valid email adress
#' @param key Secret key
#'
#' @return JWT
#' @export
secure_setup <- function(email, key) {
  # Adding heder email as spessfied by servicebot as mandetory payload
  hash <-  digest::hmac(key, email, "sha256")
}
