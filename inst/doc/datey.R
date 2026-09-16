## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datey)

## -----------------------------------------------------------------------------
start_day(2024, 3, 7)   # Start of the day 7 March 2024
mid_day(2024, 3, 7)     # Middle of the day 7 March 2024
end_day(2024, 3, 7)     # End of the day 7 March 2024

## -----------------------------------------------------------------------------
identical(end_day(2024, 3, 7), start_day(2024, 3, 8))

## -----------------------------------------------------------------------------
datey(2024, 3, 7, 0.25)   # Quarter of the way through the day 7 March 2024

## -----------------------------------------------------------------------------
r_date <- as.Date("2024-03-07")
start_day(r_date)
mid_day(r_date)
end_day(r_date)

## -----------------------------------------------------------------------------
datey(2024)           # Start of calendar year 2024
datey(2024.5)         # Midway through calendar year 2024

datey("2024-03-07")   # Start of the day 7 March 2024 (day fraction defaults to 0)
datey("2024-03-07.5") # Middle of the day 7 March 2024

## -----------------------------------------------------------------------------
t <- mid_day(2024, 3, 7)
t$year
t$month
t$day
t$day_fraction

## -----------------------------------------------------------------------------
to_ymdf(t)

## -----------------------------------------------------------------------------
as.double(t)
as.integer(t)

## -----------------------------------------------------------------------------
is_start_day(start_day(2024, 3, 7)) # TRUE
is_mid_day(mid_day(2024, 3, 7))     # TRUE
is_start_day(end_day(2024, 3, 7))   # TRUE because end = start of next day
is_mid_day(datey(2024, 3, 7, 0.25)) # FALSE

## -----------------------------------------------------------------------------
birth_date <- start_day(as.Date("1965-09-12"))
death_date <- mid_day(2024, 3, 7)
age <- death_date - birth_date
age

## -----------------------------------------------------------------------------
durationy(1)      # One year
durationy(0.5)    # Half a year
durationy(-2.5)   # Two and a half years in the past

## -----------------------------------------------------------------------------
as.double(age)
as.integer(age)   # Whole years only

## -----------------------------------------------------------------------------
start  <- start_day(2000, 1, 1)
one_year <- durationy(1)
quarter_year <- durationy(0.25)

start + one_year        # One year later
start - quarter_year    # Quarter of a year earlier

one_year - quarter_year # Three quarters of a year
one_year + quarter_year

datey(2024) < datey(2025)     # TRUE
durationy(1) > durationy(0.5) # TRUE

## -----------------------------------------------------------------------------
identical(datey(2000) + 25, 2025)     # TRUE
identical(durationy(2) * 0.05, 0.10)  # TRUE

## -----------------------------------------------------------------------------
a  <- start_day(2024, 1, 1)
b  <- start_day(2025, 1, 1)
interval <- a %to% b
interval

## -----------------------------------------------------------------------------
interval$start
interval$end
interval$duration

## -----------------------------------------------------------------------------
durationy(interval)

## -----------------------------------------------------------------------------
interval %includes% a                     # TRUE  -- start is included
interval %includes% b                     # FALSE -- end is excluded
interval %includes% mid_day(2024, 6, 15)  # TRUE

## -----------------------------------------------------------------------------
is_proper(interval)    # TRUE because start <= end
is_collapsed(interval) # FALSE because start < end

point <- a %to% a      # Empty (point) interval
is_proper(point)       # TRUE because a <= a
is_collapsed(point)    # TRUE because a >= a

## -----------------------------------------------------------------------------
period    <- start_day(2023, 7, 1) %to% end_day(2024, 6, 30)
year_2024 <- start_day(2024, 1, 1) %to% end_day(2024, 12, 31)

overlap <- period & year_2024
overlap

overlap$duration  # exposure in calendar year 2024, in years

## -----------------------------------------------------------------------------
is.na(NA_datey_)
anyNA(c(datey(2000), NA_datey_, datey(2024)))

## -----------------------------------------------------------------------------
datey(999.9, strict = FALSE)           # Outside [1000,3000]: NA
start_day(2000, 0, 12, strict = FALSE) # Invalid month: NA
mid_day(2001, 2, 29, strict = FALSE)   # Invalid day (given year and month): NA
durationy(2000.1, strict = FALSE)      # exceeds 2000-year limit: NA

## -----------------------------------------------------------------------------
start_day(2024, 1, 1) + NA_durationy_

## -----------------------------------------------------------------------------
dates <- c(datey(2021), datey(2022), datey(2023))

min(dates)
max(dates)
mean(dates)

seq(from = datey(2020), to = datey(2024), by = durationy(2))

