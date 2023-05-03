# Share
## To arrange the months by factor
avg_ride_length_by_month$month <- factor(avg_ride_length_by_month$month, levels = c("4","5","6","7","8","9","10","11","12","1","2","3"))
View(avg_ride_length_by_month)

## Average ride length in a month by rideable type
ggplot(avg_ride_length_by_month, aes(x = month, y=avg_ride_length, fill=member_casual)) +
  geom_bar(stat = "identity", position = "identity") +
  scale_y_continuous(limits = c(0, 35), breaks = seq(0, 35, 5)) +
  labs(x = "Month", y = "Average Ride Length", title=("Average Ride Length by Month"))

  ## To arrange the days by factor
avg_ride_length_by_day$day_of_week <- factor(avg_ride_length_by_day$day_of_week, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

## Get average ride length in day of week by rideable type
ggplot(avg_ride_length_by_day, aes(x = day_of_week, y=avg_ride_length, fill=member_casual)) +
  geom_bar(stat = "identity", position = "identity") +
  labs(x = "Days", y = "Average Ride Length", title=("Average Ride Length by Days In a Week"))

  ## Summarize the ride count by month
summarized_by_month_hourly_ridership <- hourly_ridership %>%
  group_by(month, hour, member_casual, year) %>%
  summarize(total_ride_count = sum(ride_count))

## Visualize ride count by month
ggplot(summarized_by_month_hourly_ridership, aes(x=hour, y=total_ride_count, color=member_casual)) +
  geom_line() +
  scale_x_continuous(breaks = seq(0, 23, 3)) +
  labs(x = "Hours", y = "Total Ride Count By Month", title = ("Total Ride Count Hourly By Month"))+
  facet_wrap(~month)

  ## Summarize the ride count by rideable type
summarized_hourly_ridership_rideable_type <- hourly_ridership %>%
  group_by(hour, member_casual, rideable_type) %>%
  summarize(total_ride_count = mean(ride_count))

## Ride count hourly by rideable type
ggplot(summarized_hourly_ridership_rideable_type, aes(x=hour, y=total_ride_count, color=member_casual)) +
  geom_line() +
  scale_x_continuous(breaks = seq(0, 23, 3)) +
  labs(x = "Hours", y = "Total Ride Count", 
  title = "Total Ride Count Hourly (Monthly Average)", 
  caption="Data retrieve from Apr 2022 - Mar 2023") +
  facet_wrap(~rideable_type)

  ## Summarize the ride count by day of week
summarized_hourly_ridership_day_of_week <- hourly_ridership %>%
  group_by(hour, member_casual, day_of_week) %>%
  summarize(total_ride_count = mean(ride_count))

## Ride count hourly by day of week
ggplot(summarized_hourly_ridership_day_of_week, aes(x=hour, y=total_ride_count, color=member_casual)) +
  geom_line() +
  scale_x_continuous(breaks = seq(0, 23, 3)) +
  labs(x = "Hours", y = "Total Ride Count", 
  title = "Total Ride Count Hourly (Monthly Average)", 
  caption="Data retrieve from Apr 2022 - Mar 2023") +
  facet_wrap(~day_of_week)

  