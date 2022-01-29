# Case study Report
This is a report on the data analysis approach and insights identified.

## Business task:
We want to discover how consumers use non-Bellabeat smart devices, and how we can improve a device to fit the useabilities and performance of similar products.
Bellabeat has a series of products identified in the [readme](https://github.com/AntonAIG/google_da_capstone/blob/main/README.md) file. We want to analyze smart device usage data and gain insights into how consumers use non-Bellabeat smart devices, and apply these insights to improve one of our products.

[Bellabeats](https://bellabeat.com/about/) helps women to unlock their full potential by providing them with tools and services that can track their health performance. Their devices are suitable for every lifestyle.
The key stakeholders shall make decisions based on the insights identified in this analysis.
First, the marketing analytics team will review this report and understand what we have discovered through this analysis. Then I can present it to the senior management (cofounders) - Sando and Srsen. Using our findings and proposals, they can adopt potential improvements that can be included in the product.

#### Product description:
Bellabeat's [Ivy](https://bellabeat.com/ivy/) is a smart device that monitors and records the heart beat rate, sleep cycle, respiratory rate, cardiac coherence, and pyhsical and mental activity of its users. With a corresponding mobile app, you can track your daily activity cycle.

## Preparing the data
Access to the data can be obtained [here](https://github.com/AntonAIG/google_da_capstone/blob/main/datasets/prepare_readme.md)
The metadata can be found [here](https://www.fitabase.com/media/1930/fitabasedatadictionary102320.pdf)
The data contains daily, hourly, and munite-level output of: Activity, Calories, heartrate, Intensities, METs, Sleep, Steps, and weigth log info.
The file format is *csv.* The data was taken from `03.12.2016` - `05.12.2016`. The datasets are in wide and long formats.
The data credible but incomplete. All tables are sorted according to the `customer id` in assending order. For our particular device, the key parameters include: customer id, datetime, heart rate, intensities, steps, sleep, and calories.

## Processing the data
The data was checked for errors in excel.
During data processing, I want clean the dataset from the individual tables and build a master table with all the information combined. The data entries will be in minutes resolutions. In other to achieve this, I have to use SQL to clean the data individually, and then join them.
This table will further be resolved to daily observations and paired with the activity and sleep tables. SQL will be used here too.
