---
layout: post_layout
title: "Healthcare Insurance - EDA and Cost Prediction using Regression Models"
date: 2025-02-01
tags: [python, data analysis, regression,]
categories: [Featured]
images:
  - assets/img/healthcare-cost.jpg
---

Predicting healthcare costs for individuals is important for various stakeholders beyond health insurers, and for various purposes. A few notable benefits of accurately predicting healthcare costs for insurance companies are determining fair and competitive premium rates, personalizing insurance plans, and optimizing resource allocation.

This notebook aims to find out how healthcare costs are driven by different variables by visualizing their relationships, and developing models to predict healthcare costs. To view the full notebook, [click here](https://github.com/Hoale2908/healthcare_insurance/blob/main/health-insurance-eda.ipynb).


## Executive Summary  

- The dataset contains demographic and health information and healthcare cost of 1,338 patients, including age, gender, BMI score, number of children, smoking status, and region (location).
 - Age, BMI, and Smoker are the variables with the most impacts on Charges (healthcare cost).
 - Based on these 3 independent variables, polynomial regression models are trained at 1, 2, and 3 degrees (i.e. linear, quadratic, and cubic) to predict Charges, and evaluated using R<sup>2</sup>. 
 - Quadratic polynomial model is the winning model since it has a strong power of explanation, with R<sup>2</sup>=84%, and remains cost-effective.


## Insights from EDA  

- Smoking and BMI affect healthcare costs. 
  - Smokers have higher healthcare costs than non-smokers.
  - Among smokers, people with higher BMI incur higher healthcare costs.
- Age affects healthcare costs, with older people have higher costs than younger people.
- Location and gender do not significantly affect healthcare costs.
- People with more children are mainly non-smokers. The causal relationship between the number of children and smoking status, or vice versa, cannot be determined through this dataset.

<img src="https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___16_0.png" alt="Healthcare Insurance heatmap" class="post-image">

<img src="https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___21_0.png" alt="Healthcare Insurance chart" class="post-image">


## Model Development and Evaluation

### 1. Linear Regression Model

A linear regression model is fitted with Smoker, Age, and BMI. The intercept and coefficients are respectively:

<img src="https://raw.githubusercontent.com/Hoale2908/healthcare_insurance/6a934c82a6ddb116c3fe86d1c7753529ef302939/LR%20model.png" alt="linear model" class="post-image">

In other words: 
- A person who smokes will incur $23,702 higher cost compared to someone who does not smoke (with the same BMI, at the same age).
- For every one year older, one will have to pay $250 more.
- For every one point of BMI higher, one will have to pay $304 more.

This model is not very accurate because it can only explain 75% of the time, as illustrated by R<sup>2</sup> = 0.747. This could be because we have not account for the relationship among the independent variables, particularly between Smoker and BMI. As such, we can try fitting a quadratic regression model.


### 2. Quadratic Regression Model

Using the same variables and data, our fitted model has:

<img src="https://raw.githubusercontent.com/Hoale2908/healthcare_insurance/6a934c82a6ddb116c3fe86d1c7753529ef302939/quadratic%20model.png" class="post-image">

As we can see, our model now has 9 coefficients. R<sup>2</sup> = 0.838 means that it has a higher accuracy compared to the linear regression model above.

We will continue with a cubic polynomial model as a way to improve model accuracy.


### 3. Cubic Regression Model

Similarly, we used the same independent variables for training purposes. Below are the intercept and coefficients:

<img src="https://raw.githubusercontent.com/Hoale2908/healthcare_insurance/6a934c82a6ddb116c3fe86d1c7753529ef302939/cubic%20model.png" alt="cubic model" class="post-image">

Using a cubic model only improved R<sup>2</sup> from 0.838 to 0.841 while it likely requires more computing resources to implement and harder to explain to non-technical stakeholders (19 coefficients for 3 variables, and will exponentially increase if we have more than 3 variables).

Therefore, we will choose the quadratic model as the final winner.

## Conclusion

Through EDA, we learned that Age, Smoker and BMI are the three most influential variables in predicting healthcare cost. This is consistent with real life observations.

The quadratic polynomial model is the best among the three trained models. It is more powerful than the linear regression model because it takes into account the correlation between Smoker and BMI. Additionally, it is simpler and more cost-effective than the cubic model.

Future improvements can be seen by using machine learning models, or by feature engineering.
