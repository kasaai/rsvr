
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rsvr

<!-- badges: start -->

<!-- badges: end -->

Initial prototyping for a tidy approach for loss reserving

``` r
library(tidyverse)
#> ── Attaching packages ──────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.0       ✔ purrr   0.3.2  
#> ✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
#> ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
#> ✔ readr   1.3.1       ✔ forcats 0.3.0
#> ── Conflicts ─────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(rsvr)

data <- ChainLadder::ABC %>%
  as.data.frame() %>%
  as_tibble() %>%
  mutate(
    origin = as.integer(origin),
    dev = as.integer(dev),
    type = "paid_loss",
    segment = "west-auto",
    currency = "USD",
    origin_interval = 1,
    dev_interval = 1
  )

mack_spec <- mack_chain_ladder()
mack_spec
#> Mack Chain Ladder Model Specification

result <- mack_spec %>% 
  fit(data)
result
#> Mack Chain Ladder Model
```
