<!-- PROCESS -->
# Process

## Case Study Roadmap
Guiding Questions
- What tools are you choosing and why?
- Have you ensured your data’s integrity?
- What steps have you taken to ensure that your data is clean?
- How can you verify that your data is clean and ready to analyze?
- Have you documented your cleaning process so you can review and share those results?

Key tasks
1. Check the data for errors. 
2. Choose your tools. 
3. Transform the data so you can work with it effectively. 
4. Document the cleaning process.

Deliverable
- Documentation of any cleaning or manipulation of data

## Cleaning and transform

First thing i did was to check if the data type and column name is consistent throughout the dataset

```sh
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
```

![Data Consistency](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/check-consistency.png)

This was the output, which shows that the data type and column is consistent.

What i did next was to combine dataframe together as all_trips
```sh
## Combine into 1 dataframe
all_trips <- bind_rows(apr_22, may_22, jun_22, jul_22, aug_22, sep_22, oct_22, nov_22, dec_22, jan_23, feb_23, mar_23)
```
I also did some check to ensure that the members and ride type is consistent

```sh
## Run unique to ensure that the member naming and rideable type is consistent
unique(all_trips$member_casual)
unique(all_trips$rideable_type)
```
![Member and Rideable Type](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/check-member-rideable-type.png)

The output shows that there is only 2 members type and 3 ride type


> Note: While working with the data, i found out that there was no docked_bike tied to member which was unusual. After much research I found out that classic_bike and docked_rike refers to the same thing, hence I update all docked_bike to classic_bike


```sh
## Update column rideable_type where "docked_bike" to "classic_bike"
all_trips <- within(all_trips, rideable_type[rideable_type == 'docked_bike'] <- 'classic_bike')
```

With the current dataframe, I break down the dates based on the started_date, into their respective day of the week, months, days, years and hour. I also calculated the ride length based on the trip start and end time in minutes.

```sh
## Create a new columns to find the ride length in minutes
all_trips$ride_length <- as.integer(difftime(all_trips$ended_at, all_trips$started_at, units = "mins"))

## Add a day and month column based on started
all_trips$day_of_week <- format(as.Date(all_trips$started_at), "%A")
all_trips$month <- month(all_trips$started_at)
all_trips$days <- format(as.Date(all_trips$started_at), "%d")
all_trips$year <- format(as.Date(all_trips$started_at), "%Y")
all_trips$hour <- hour(all_trips$started_at)
```

After I have make the neccessary transformation, I clean the dataframe by removing rows where the member_casual is NA or ride_length is NA. I also remove outlier rows where the ride_length is less than 1 minute or more than 24 hours.

```sh
## Since our main focus is ride_length and member_casual, I will remove any rows where the columns is NA for these two column or ride length is less than 0
all_trips_clean <- all_trips %>%
  filter(complete.cases(member_casual)) %>%
  filter(complete.cases(ride_length)) %>%
  filter(between(ride_length, 1, 60*24))

## Check that data is okay
summary(all_trips_clean)
head(all_trips_clean)
```
![NA end lat and long](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/all-trips-clean-na.png)

The output shows that there were some NA's for end latitude and longitude, but since I won't be analysising these information, i decide to keep those affected datas and continue

<p align="right">(<a href="https://github.com/brucewzj99/data-analytics-casestudy/tree/main/Analyze">next | analyze</a>)</p>