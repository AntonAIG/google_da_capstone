# import neccessary packages
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)
library(readr)

# we import the neccessary dataset here
activity <- read_csv("bellabeat_case_study/dailyActivity_merged.csv")
intensities <- read_csv("bellabeat_case_study/hourlyIntensities_merged.csv")
calories <- read_csv("bellabeat_case_study/dailyCalories_merged.csv")
sleep <- read_csv("bellabeat_case_study/sleepDay_merged.csv")
weight <- read_csv("bellabeat_case_study/weightLogInfo_merged.csv")

# a little exploration of the data
View(weight)
head(sleep, 10)

# data processing
#intensity date and time formatting
intensities$ActivityHour = as.POSIXct(intensities$ActivityHour,
                                      format="%m/%d/%Y %H:%M:%S %p",
                                      tz=Sys.timezone())
intensities$time <- format(intensities$ActivityHour,
                           format="%H:%M:%S")
intensities$date <- format(intensities$ActivityHour,
                           format="%m/%d/%y")

#calories date and time formatting
calories$ActivityDay = as.POSIXct(calories$ActivityDay,
                                 format="%m/%d/%Y %I:%M:%S %p",
                                 tz=Sys.timezone())
calories$time <- format(calories$ActivityDay, format = "%H:%M:%S")
calories$date <- format(calories$ActivityDay, format = "%m/%d/%y")

#activities date and time formatting
activity$ActivityDate = as.POSIXct(activity$ActivityDate,
                                   format="%m/%d/%Y",
                                   tz=Sys.timezone())
activity$date <- format(activity$ActivityDate, format = "%m/%d/%y")

#sleep date formatting
sleep$SleepDay = as.POSIXct(sleep$SleepDay,
                            format="%m/%d/%Y %I:%M:%S %p",
                            tz=Sys.timezone())
sleep$date <- format(sleep$SleepDay, format = "%m/%d/%y")

#Data Exploration:
#number of unique entries in each table
name <- c("activity","calories","intensities","sleep","weight")
activity1 <- n_distinct(activity$Id)
calories1 <- n_distinct(calories$Id)
intensities1 <- n_distinct(intensities$Id)
sleep1 <- n_distinct(sleep$Id)
weight1 <- n_distinct(weight$Id)
unique_count <- c(activity1, calories1, intensities1, sleep1, weight1)
unique_df <- data.frame(name,unique_count)

## additional summary statistics
#activity
activity %>% 
  select(TotalSteps, TotalDistance, SedentaryMinutes, Calories) %>% 
  summary()

# number of active minutes per category
activity %>% 
  select(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes) %>% 
  summary()

#summary statistics of calories
calories %>% select(Calories) %>% summary()

#summary statistics of sleep
sleep %>% select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed) %>% 
  summary()

#summary statistics of weight
weight %>% select(WeightKg, BMI) %>% summary()

## merging the data
data_merged <- merge(sleep, activity, by=c('Id', 'date'))
head(data_merged)

#visualization of the data
ggplot(data=activity, aes(x=TotalSteps, y=Calories)) +
  geom_point() + geom_smooth() +
  labs(title="Total Steps vs. Calories")

#total Minutes Asleep vs. Total time in bed
ggplot(data=sleep, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) +
  geom_point() + labs(title="Total Minutes Asleep vs. Total Time in Bed")

#minutes asleep vs sedentary minutes
ggplot(data=data_merged, aes(x=TotalMinutesAsleep, y=SedentaryMinutes)) +
  geom_point(color='darkblue') + geom_smooth() +
  labs(title="Minutes Asleep vs. Sedentary Minutes")
