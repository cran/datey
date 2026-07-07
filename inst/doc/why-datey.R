## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datey)

## -----------------------------------------------------------------------------
start <- start_day(2000, 1, 1)

half_year <- durationy(0.5)
two_steps <- (start + half_year) + half_year
one_step  <- start + (half_year + half_year)

two_steps
one_step
identical(two_steps, one_step)

## -----------------------------------------------------------------------------
time_at_risk <- start_day(2023, 4, 1) %to% end_day(2024, 4, 1)
rate_period_2024 <- start_day(2024, 1, 1) %to% end_day(2025, 12, 31)

# the part of the time at risk to which the 2024 rate applies
overlap <- time_at_risk & rate_period_2024
overlap

# ... as a duration in years, ready to multiply by an annual rate
durationy(overlap$end - overlap$start)

## -----------------------------------------------------------------------------
y <- 2026L
m <- 1L
d <- 1L
one_day_period <- start_day(y, m, d) %to% end_day(2026, m, d)
one_day_period

mid <- mid_day(y, m, d)
mid

interval_includes(one_day_period, mid)

