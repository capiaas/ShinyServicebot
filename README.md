#  ShinyServicebot <img src="man/figures/logo.png" align="right" width=120 height=139 alt="" />

[![CRAN
version](https://www.r-pkg.org/badges/version/shinyservicebot)](https://cran.r-project.org/package=shinyservicebot)

`shinyservicebot` Create in-app purchasing and subscriptions through 'Servicebot' payment using the 'Stripe' framework.

## What is Servicebot and Stripe

### Servicebot
"Servicebot provides a user interface (UI) on top of Stripe. Stripe will remain the single source of truth for all things billing which makes Servicebot the easiest & fastest way to launch with Stripe."

[Click here](https://docs.servicebot.io/) for more information about 
servicebot.

### Stripe
Online payment processing for internet businesses. Stripe is a suite of payment APIs that powers commerce for online businesses

[Click here](https://stripe.com) for more information about stripe.


## Installation

```r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("capiaas/shinyservicebot")
```


## Getting Started

To learn more we highly recommend you check out the [servicebot docs](https://docs.servicebot.io/). The site will explain in depths the setup of Servicebot.

### Servicebot setup
 - Setup Servicebot account: https://dashboard.servicebot.io/signup
 - Available config parameters [Click here](https://docs.servicebot.io/subscription-portal/subscription-management-portal/subscription-management-portal-configuration).

## In use

### Initialize servicebot
Initialize servicebot by running the init command.

#### Development mode
```
# -------
# FOR DEVELOPMENT
# -------
shinyservicebot::init(dev_mode = TRUE)
```

#### Live mode
```
# -------
# FOR LIVE PRODUCTION
# -------
shinyservicebot::init(
   servicebot_secret    = "Your servicebot secret",
   secure_setup         = TRUE
)
```


### Example: Pricing embed:
```
library(shinyservicebot)

# init servicebot pr user login
shinyservicebot::init(dev_mode = TRUE)
# Config
servicebot_config = list(
  servicebot_id =  "E0OQN0P0Dort", # // LIVE & TEST MODE IDs ARE DIFFERENT
  service =   "Flat Subscription",
  email =  "shinyservicebot36io3ejbyf1pea7g61mxki@yopmail.com"
)
# Render the shinyservoicebot pricing
shinyservicebot::shinyservicebotOutput("servicebot")


```
![Pricing page](inst/assets/img/pricing_page.png "fig:")


### Example: Pricing embed in Shiny app
```
library(shiny)
library(shinyservicebot)

# init servicebot pr user login
shinyservicebot::init(dev_mode = TRUE)
# Config
servicebot_config = list(
  servicebot_id =  "E0OQN0P0Dort", # // LIVE & TEST MODE IDs ARE DIFFERENT
  service =   "Flat Subscription",
  email =  "shinyservicebot36io3ejbyf1pea7g61mxkh@yopmail.com"
)

# UI ----
ui <- fluidPage(
  # App title ----
  titlePanel("SERVICEBOT PRICING PAGE"),
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
```
![Pricing page](inst/assets/img/pricing_page.png "fig:")


### Example: Portal embed in Shiny app
```
library(shiny)
library(shinyservicebot)

# -------
# FOR LIVE PRODUCTION
# -------
# shinyservicebot::init(
#   servicebot_secret    = "Your servicebot secret",
#   secure_setup         = TRUE
# )

# -------
# FOR DEVELOPMENT
# -------
shinyservicebot::init(dev_mode = TRUE)

# Config
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

```
![Portal page](inst/assets/img/subscription_portal.png "fig:")

## Examples
You can run examples directly from the package

```
 # Test pricing embed in shiny app
 shinyservicebot::runPricingExample()

 # Test portal embed in shiny app
 shinyservicebot::runPortalExample()

 # Test signup embed in shiny app
 shinyservicebot::runSignupExample()
```


## Disclaimer

This package is not affiliated with any of the service providers it supports.
