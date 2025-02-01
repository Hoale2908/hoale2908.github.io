---
layout: post_layout
title: "A Snow Day in Boston and a Python Project"
date: 2025-01-20
tags: [python, ]
categories: [Reflection]
images:
- assets/img/boston-in-snow.jpg
---

It was snowing here in Boston on a long holiday weekend as it usually does every winter. But yesterday there was a snowstorm coming. I canceled my plan to go to the Boston Public Library because I didn't want to be trapped outside or on the problematic subway during such condition. 

As I stayed at home, I wondered if it has been snowing more or less over the recent years in Boston, and how often Boston had snowstorms. And so I decided to find the answers through data, which led me to a simple yet interesting project. 


## So, what is this project?

I found the Massachusetts weather data from January 2019 to August 2024 from the NOAA website. It contained more than 15 types of weather events in all MA counties, with time, location, and a few more data.

Here's some interesting insights: 

- The weather in Boston (Suffolk county) is tough but my analysis shows that it is way tougher in Worcester, Berkshire, and Middlesex -- they are the hotspots for extreme weather in this state. Do not buy a house in Berkshire County if you don't want to face the most kinds of extreme weather: snow storms and extreme cold in the winter; floods, heat and hails in the summer; and strong winds.

![Counties with the most events](https://github.com/Hoale2908/MA_Weather/raw/main/image-2.png)


- My friends and I use to "complain" that we don't have as much snow as before, and we are right. The number of snow events significantly decreased in 2020, and stayed low ever since with only minimal increase. Looking at the trend of heavy snows, I can anticipate to see a few more coming to Boston before April.

![Events over time](https://github.com/Hoale2908/MA_Weather/raw/main/image-1.png)

![Heavy snows](https://github.com/Hoale2908/MA_Weather/raw/main/image-5.png)


- Perhaps what surprised me the most was the number of events related to thunderstorm and wind. Boston truly lives up to the legend of a windy and freezing cold New England. No wonder why it is so hard for me (and my chronic sinuses) to adapt. This is a good lesson - always do a research on the weather before moving to a new city.

![Events by type](https://github.com/Hoale2908/MA_Weather/raw/main/image.png)


The full analysis with code can be found [here](https://github.com/Hoale2908/MA_Weather/tree/main).


## What did I learn through this project?

### Find data sources and compiling data

I started with a Google search for "snow storm data" and it led me to several websites. However, they all seemed to point to the NOAA National Centers for Environmental Information's website. They are researchers, not a commercial company so the portal was not very user-friendly. Because the data can only be downloaded manually and each file can have less than 500 records, I went ahead and downloaded the data of the last 5 years. After joining them together, I uploaded the final dataset on [Kaggle](https://www.kaggle.com/datasets/hoale2908/massachusetts-weather) so others can use it. 

### Investigate data for reclassification

This part was quite time-consuing but very satisfying. There was no missing data but the data format was not standardized. I had to look into the data type and make some conversion for the dates and times. It was a good chance for me to learn more about some time series methods of pandas, and the datetime library.

I also found out that the categories were not 100% correct, such as those mentioned "heavy snow" but was initially classified as "wind", so some reclassifying were required. 

Moreover, grouping events into larger groups were also helpful for visualization because most people would struggle differentiating more than 5-6 categories in one chart. So I grouped events into flood-related, wind-related, snow-related, and so on. Grouping counties and zones with the same name (e.g. Berkshire County and Berkshire Zone), and months into seasons were also done. This proved to be very useful for analysis. 

### Visualization: Only show one or two key ideas

It is a common mistake to use complex charts because they look "fancy" and "smart". At first, I tried to plot the data and use all parameters available and I found it difficult to describe the main idea of the chart. This means that readers would also have a hard time grasping the idea. To fix it, I decided to only include just enough information to answer the main question and remove any parameters that make the chart look too busy.

___
<br>
I had a wonderful time staying warm inside and following my curiousity to new discovery. I hope you enjoyed learning more about the weather in Massachusetts as much as I did.
