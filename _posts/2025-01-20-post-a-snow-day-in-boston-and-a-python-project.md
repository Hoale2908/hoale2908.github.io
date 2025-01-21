layout: post
title: "A Snow Day in Boston and a Python Project"
date: 2025-01-21
tags: [python, data analysis, reflection]

# A Snow Day in Boston and a Python Project

It was snowing here in Boston on a long weekend (Martin Luther King's day) as it usually does every winter. But yesterday there was a snowstorm coming and the Weather app on iPhone (or some other website behind it) predicted that it would start at 1 PM. I delayed my plan to go to the Boston Public Library because I didn't want to be trapped outside or on the problematc T during such condition. As I stayed at home, I wondered if it has been snowing more or less over the recent years in Boston? How often does Boston have snow or storms? And there I decided to find the answers through data, which led me to a small yet interesting project.

## So, what is this project?

I downloaded the Massachusetts weather data from January 2019 to August 2024 from the NOAA website. It contained more than 15 types of weather events in all MA counties, with time, location, and a few more data. Because I had to download data manually, and each period of data downloaded should have less than 500 records, I didn't have time to get more data. 

Boston's weather (Suffolk county) is tough but my analysis shows that it is wayyy tougher in Worcester, Berkshire, and Middlesex -- they are the hotspots for extreme weather in this state. Do not buy a house in Berkshire County if you don't want to face the most kinds of extreme weather: snow storms and extreme cold in the winter; floods, heat and hails in the summer; and strong winds.
(img)[https://github.com/Hoale2908/MA_Weather/raw/main/image-2.png]

My friends and I use to "complain" that we don't have as much snow as before, and we are right. The number of snow events significantly decreased in 2020, and stayed low ever since with only minimal increase. Looking at the trend of heavy snows, I can anticipate to see a few more coming to Boston before April.

Perhaps what surprised me the most was the number of events related to thunderstorm and wind. Boston truly lives up to the legend of a windy and freezing cold New England. No wonder why it is so hard for me (and my chronic sinuses) to adapt. This is a good lesson - always do a research on the weather before moving to a new city.

## What did I learn in term of data analysis?

### Find data sources and compiling data for my research
I started with a Google Search for "snow storm data" and it led me to several websites. However, they all seemed to point to the NOAA. They are researchers, not commercial companies so the portal was not very user-friendly. I had to manually download pieces of data in CSV. After gathering and concatenating, I uploaded the final dataset on Kaggle so others can use it. 

### Investigate data for reclassification
This part was quite time-consuing but very satisfying. There was no missing data but the data format was not standardized. I had to look into the data type and make some conversion for the dates and times. It was a good chance for me to learn more about some time series methods of pandas, and the datetime library.

I also found out that the provided categories were not 100% correct, so some reclassifications were required. This was made based on the narrative of the events, such as those mentioned "heavy snow" but was initially classified as "wind". 

Moreover, grouping events into larger groups were also helpful for visualization because most people would struggle differentiating more than 5-6 categories in a chart. So, I grouped events into flood-related, wind-related, snow-related, and so on. Grouping county and zone of the same name, and months into seasons were also made for the same purpose. This proved to be very useful for analysis. 

### Visualziation: Only show one or two key ideas
It is a common mistake to try to use complex charts because they look "fancy" and "smart". At first, I also tried to plot the data and use all parameters available. I found it difficult to describe what the chart shows which means that readers would also have a hard time grasping the idea. To fix that, I decided to only include just enough information to answer the main question that the chart is used to demonstrated. If any parameter makes the chart look too busy, I would remove it.