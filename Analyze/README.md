<!-- ANALYZE -->
# Analyze

## Case Study Roadmap
Guiding Questions
- How should you organize your data to perform analysis on it? 
- Has your data been properly formatted? 
- What surprises did you discover in the data? 
- What trends or relationships did you find in the data? 
- How will these insights help answer your business questions

Key tasks
1. Aggregate your data so it’s useful and accessible. 
2. Organize and format your data. 
3. Perform calculations. 
4. Identify trends and relationship

Deliverable
- A summary of your analysis 

## Analysis

For the analysis, one of my to do was to find how difference was the usage of bike between casual members and annual members. 
- [x] Find out why casual and annual members differ

To achieve that, these are the 3 key things I want to find out:
1. The average ride length by month, for members and ride types.
2. The average ride length by day of week, for members and ride types.
3. The hourly ridership (ride count) daily for the 1 year, for members and ride types.

Why I choose these 3 is because I want to to find out how often and when do members use the bike compared to casual and how long do they use it for. 

1. The average ride length by month, for members and ride types.
```sh
# Analyze
## Calculate the average ride length by month
avg_ride_length_by_month <- all_trips_clean %>%
  group_by(member_casual, rideable_type, month, year) %>%
  summarize(avg_ride_length = mean(ride_length))

## The average ride length for member
arlbm_member <- avg_ride_length_by_month %>%
  filter(member_casual == "member") %>%
  summarize(mean_avg_ride_length = mean(avg_ride_length))
summary(arlbm_member)summary(arlbm_member)
### Mean: 11.509

## The average ride length for casual
arlbm_casual <- avg_ride_length_by_month %>%
  filter(member_casual == "casual") %>%
  summarize(mean_avg_ride_length = mean(avg_ride_length))
summary(arlbm_casual)
### Mean: 19.879
```
![avg ride length by month](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/average_ride_length_by_month.png)

The output shows that the average mean for member is 11.509 while casual is 19.879

2. The average ride length by day of week, for members and ride types.
```sh
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
```
![avg ride length by day](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/average_ride_length_by_day.png)

This is just one example for one of the day, the average ride length for each day is as follow - Mon: 16.83, Tue: 15.65, Wed: 15.18, Thur: 15.72, Fri: 16.34, Sat:18.81, Sun: 18.95

3. The hourly ridership (ride count) daily for the 1 year, for members and ride types.
``` sh
## Calculate the number of trip per hour
hourly_ridership <- all_trips_clean %>%
  group_by(member_casual, rideable_type, year, month, days, hour, day_of_week) %>%
  summarize(ride_count = n())

## The number of ride hourly for members
hourly_ridership_member %>%
  filter(member_casual == "member") %>%
  summarize(member_ride_count = sum(ride_count))
summary(hourly_ridership_member)
### Median 148

## The number of ride hourly for casuals
hourly_ridership_casual %>%
  filter(member_casual == "casual") %>%
  summarize(member_ride_count = sum(ride_count))
summary(hourly_ridership_casual)
### Median 61
```
![hourly ride member](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/hourly_ride_member.png)

![hourly ride casual](https://github.com/brucewzj99/data-analytics-casestudy/blob/main/Images/hourly_ride_casual.png)

The output shows the mean, median and maximum ride count for each hour daily.

## Observation

Based on the data i retrieve from the 3 key things, here are my observation:

Members ride more often, this might be due to...
- Annual memberships entails unlimited 45 minutes ride, hence might be the main driver why members ride more often
- The fact that members use it to commute to work daily

Casual ride longer duration, this might be due to...
- Day Pass which allows rides up to 3 hours before having to pay extra
- Casual riders usually use it for leisure hence are not deterred by the extra cost per minute (lesser rides, longer ride lenghts)

The average ride on weekends is longer, this might be due to...
- Not being a working day, hence more riders might use it to ride for longer duration

<p align="right">(<a href="https://github.com/brucewzj99/data-analytics-casestudy/tree/main/Share">next | share</a>)</p>