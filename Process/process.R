# Process
## Loading libraries
install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(ggplot2)

## Find out if column name and type is consistent
str(apr_22)
str(may_22)
str(jun_22)
str(jul_22)
str(aug_22)
str(sep_22)
str(oct_22)
str(nov_22)
str(dec_22)
str(jan_23)
str(feb_23)
str(mar_23)
### Output: Data type and column is consistent

## Combine into 1 dataframe
all_trips <- bind_rows(apr_22, may_22, jun_22, jul_22, aug_22, sep_22, oct_22, nov_22, dec_22, jan_23, feb_23, mar_23)

## Run unique to ensure that the member naming is consistent
unique(all_trips$member_casual)
unique(all_trips$rideable_type)
### Output tell us that there is only 2 member type, member and casual

## Update column rideable_type where "docked_bike" to "classic_bike"
all_trips <- within(all_trips, rideable_type[rideable_type == 'docked_bike'] <- 'classic_bike')

## Create a new columns to find the ride length in minutes
all_trips$ride_length <- as.integer(difftime(all_trips$ended_at, all_trips$started_at, units = "mins"))

## Add a day and month column based on started
all_trips$day_of_week <- format(as.Date(all_trips$started_at), "%A")
all_trips$month <- month(all_trips$started_at)
all_trips$days <- format(as.Date(all_trips$started_at), "%d")
all_trips$year <- format(as.Date(all_trips$started_at), "%Y")
all_trips$hour <- hour(all_trips$started_at)

## Since our main focus is ride_length and member_casual, I will remove any rows where the columns is NA for these two column or ride length is less than 0
all_trips_clean <- all_trips %>%
  filter(complete.cases(member_casual)) %>%
  filter(complete.cases(ride_length)) %>%
  filter(between(ride_length, 1, 60*24))

## Check that data is okay
summary(all_trips_clean)
head(all_trips_clean)
### Notice that there is NA's for end_lat and end_lng, but would not affects the results