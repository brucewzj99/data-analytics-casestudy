# Analyze
## Calculate the average ride length by month
avg_ride_length_by_month <- all_trips_clean %>%
  group_by(member_casual, rideable_type, month, year) %>%
  summarize(avg_ride_length = mean(ride_length))

## The average ride length for member
arlbm_member <- avg_ride_length_by_month %>%
  filter(member_casual == "member") %>%
  summarize(mean_avg_ride_length = mean(avg_ride_length))
summary(arlbm_member)
### Mean: 11.509

## The average ride length for casual
arlbm_casual <- avg_ride_length_by_month %>%
  filter(member_casual == "casual") %>%
  summarize(mean_avg_ride_length = mean(avg_ride_length))
summary(arlbm_casual)
### Mean: 19.879

## Calculate the average ride length by day of week
avg_ride_length_by_day <- all_trips_clean %>%
  group_by(member_casual, rideable_type, day_of_week) %>%
  summarize(avg_ride_length = mean(ride_length))

## The average ride length on x day
arlbd_x <- avg_ride_length_by_day %>%
  filter(day_of_week== "Sunday") %>%
  summarize(mean_avg_ride_length = mean(avg_ride_length))
summary(arlbd_x)
### Mon: 16.83, Tue: 15.65, Wed: 15.18, Thur: 15.72, Fri: 16.34, Sat:18.81, Sun: 18.95

## Calculate the number of trip per hour
hourly_ridership <- all_trips_clean %>%
  group_by(member_casual, rideable_type, year, month, days, hour, day_of_week) %>%
  summarize(ride_count = n())

hourly_ridership_member <- hourly_ridership %>%
  filter(member_casual == "member") %>%
  summarize(member_ride_count = sum(ride_count))
summary(hourly_ridership_member)

hourly_ridership_casual <- hourly_ridership %>%
  filter(member_casual == "casual") %>%
  summarize(member_ride_count = sum(ride_count))
summary(hourly_ridership_casual)