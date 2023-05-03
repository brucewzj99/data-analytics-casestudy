<!-- SHARE -->
# Share

## Case Study Roadmap
Guiding Questions
-  Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently? 
- What story does your data tell? 
- How do your findings relate to your original question?
- Who is your audience? What is the best way to communicate with them? 
- Can data visualization help you share your findings? 
- Is your presentation accessible to your audience?

Key tasks
1. Determine the best way to share your findings.
2. Create effective data visualizations.
3. Present your findings.
4. Ensure your work is accessible.

Deliverable
- Supporting visualizations and key findings

## Visualization

Since I have the analysis perform in the previous steps, I will first make the visualization to gain more insights for it.

1. Visualisation of avg_ride_length_by_month
_To note: The months are arranged this way as January to March is for the Y2023, while the rest of the month is for Y2020_
```sh
# Share
## To arrange the months by factor
avg_ride_length_by_month$month <- factor(avg_ride_length_by_month$month, levels = c("4","5","6","7","8","9","10","11","12","1","2","3"))
View(avg_ride_length_by_month)

## Average ride length in a month by rideable type
ggplot(avg_ride_length_by_month, aes(x = month, y=avg_ride_length, fill=member_casual)) +
  geom_bar(stat = "identity", position = "identity") +
  scale_y_continuous(limits = c(0, 35), breaks = seq(0, 35, 5)) +
  labs(x = "Month", y = "Average Ride Length", title=("Average Ride Length by Month"))
```

![average ride length by month viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/average_ride_length_by_month_viz.png)

I then apply a facet_wrap(~rideable_type) to farther break down into the respective bikes.

![average ride length by month by bike viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/average_ride_length_by_month_bike_viz.png)

2. Visualisation of avg_ride_length_by_day
```sh
## To arrange the days by factor
avg_ride_length_by_day$day_of_week <- factor(avg_ride_length_by_day$day_of_week, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

## Get average ride length in day of week by rideable type
ggplot(avg_ride_length_by_day, aes(x = day_of_week, y=avg_ride_length, fill=member_casual)) +
  geom_bar(stat = "identity", position = "identity") +
  labs(x = "Days", y = "Average Ride Length", title=("Average Ride Length by Days In a Week"))
```
![average ride length by day viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/average_ride_length_by_day_viz.png)

I then apply a facet_wrap(~rideable_type) to farther break down into the respective bikes.

![average ride length by day by bike viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/average_ride_length_by_day_bike_viz.png)

3. Visualisation of hourly_ridership
```sh
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
```

![hourly ride monthly viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/hourly_ride_monthly_viz.png)

I also break down the hourly_ridership into the two different bike
```sh
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
```
![hourly ride bike viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/hourly_ride_bike_viz.png)

As well as breaking it down by day_of_week
```sh
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
```
![hourly ride day of week viz](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/hourly_ride_day_of_week_viz.png)

## Observation

Based on the visualization created, here are my additional observation:

Average ride length is longer for classic_bike compared to electric_bike, this might be due to...
- The faster speed offered by electric_bike, commuters will be able to reach their destination at a faster speed hence the lower average ride length
- The cost might also be the reason, since electric_bike require additional cost, consumer might choose electric_bike only for short duration

Most people ride between 6-9th hour and 15th-18th hour, this might be due to...
- The timing where users commute to and from work hence there is a peak during these period

More rides between May to August (no of rides for casual similar to members), this might be due to...
- Due to the season, there is more people using the bike

Casual ride slow down drastically during December to March, this might be due to...
- As this period is the winter season, using the bike might not be as worth while hence the number of casual riders drops

Member prefer the use of classic bike, this might be due to...
- Not having to pay any additional fees on top of the annual membership fees

Casual tend to prefer using electric bike, this might be due to...
- Since casual are using on a pay-per-basis they are more open to paying more

Casual usage increase over the weekend while member usage decrease, this might be due to...
- Weekend being off day, hence there is lesser member using the bike (their main use is to commute to work), while for casual its for leisure purposes

<p align="right">(<a href="https://github.com/brucewzj99/data-analytics-casestudy/tree/main/Act">next | act</a>)</p>