---
layout: post
title: "Forecasting Sticker Sales: EDA & Preprocessing with Time Series"
date: 2025-01-27
tags: [python, data analysis, kaggle, time series,]
---

In this blog post, I explore how to forecast sticker sales using exploratory data analysis and preprocessing techniques. Below is the Kaggle notebook embedded for a detailed walkthrough:

<div class="responsive-iframe">
  <iframe 
    src="https://nbviewer.org/github/Hoale2908/kaggle_forecasting_sticker_sales/blob/main/forecasting-sticker-sales-eda-preprocessing.ipynb"
    frameborder="0" 
    allowfullscreen>
  </iframe>
</div>

<style>
  .responsive-iframe {
    width: 100%;
    height: 0;
    padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
    position: relative;
  }
  .responsive-iframe iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
</style>

## What did I learn

There are three main lessons that I learned: Working with Time Series, Adding external data, and Creating functions.

### Working with Time Series

This is the first time I process a dataset with time series. I had to find a book to learn about different methods, common approaches for data cleaning and data transformation on this type of data. The book was extremely helpful in providing me with the foundations. 

Working with date and time using the <code>datetime</code> library. Such a powerful library to convert data to date and/or time; create new data such as quarter, week of year, etc; compute moving average; and so on.

 
