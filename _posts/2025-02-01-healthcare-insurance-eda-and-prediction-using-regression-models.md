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

This notebook aims to find out how healthcare costs are driven by different variables by visualizing their relationships, and developing models to predict healthcare costs. 

The dataset contains demographic and health information and healthcare cost of 1,338 patients, including age, gender, BMI score, number of children, smoking status, and region (location).

To view the full notebook, [click here](https://github.com/Hoale2908/healthcare_insurance/blob/main/health-insurance-eda.ipynb).

## Executive Summary  
 - Exploratory Data Analysis shows that Age, BMI, and Smoker have impacts on Charges (healthcare cost).
 - Based on these 3 independent variables -- Age, BMI and Smoker, polynomial regression models are trained at 1, 2, and 3 degrees (i.e. linear, quadratic, and cubic) to predict healthcare cost, and evaluated using R^2. 
 - Quadratic polynomial model is the winning model since it has a strong power of explanation, with R^2=84%, and remains cost-effective.


## Insights from EDA  
- Smoking and BMI affect healthcare costs. 
  - Smokers have higher healthcare costs than non-smokers.
  - Among smokers, people with higher BMI incur higher healthcare costs.
- Age affects healthcare costs, with older people have higher costs than younger people.
- Location and gender do not significantly affect healthcare costs.
- People with more children are mainly non-smokers. The causal relationship between the number of children and smoking status, or vice versa, cannot be determined through this dataset.

![heatmap](https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___16_0.png)

![chart](https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___21_0.png)


## Model development and evaluation

### Linear Regression Model

A linear regression model is fitted with Smoker, Age, and BMI. The intercept and coefficients are respectively:
- Intercept: -10769.654425041617
- Coefficients: [23702.26154321   250.1284211    304.13776941]

In other words, it means: 
- A person who smokes will incur $23,702 higher cost compared to someone who does not smoke (with the same BMI, at the same age).
- For every one year older, one will have to pay $250 more.
- For every one point of BMI higher, one will have to pay $304 more.

This model is not very accurate because it can only explain 75% of the time, as illustrated by R^2 = 0.747. This could be because we have not account for the relationship among the independent variables, particularly between Smoker and BMI. As such, we can try fitting a quadratic regression model.

### Quadratic Regression Model

Using the same variables and data, our fitted model has:
- Intercept: -6044.03137971318
- Coefficients: [-1.05745401e+04  
                +6.60928705e+01  
                +5.21729101e+02 
                -1.05745401e+04
                +1.95138161e+01  
                +1.44168187e+03  
                +1.78542459e+00  
                +1.53447523e+00
                -9.35711839e+00]

As we can see, our model now has 9 coefficients. 
R^2 = 0.838 means that it has a higher accuracy compared to the linear regression model above. 
We will continue with a cubit polynomial model as a way to improve model accuracy.

### Cubic Regression Model

Similarly, we used the same independent variables for training purposes. Below are the intercept and coefficients:
 - Intercept: 25609.667306455973
 - Coefficients: [-8.82017925e+03  1.44747747e+02 -2.69938606e+03 -8.82017925e+03
 -1.51725305e+01  9.31280521e+02  1.86820724e+00 -1.78902617e+00
  9.34367872e+01 -8.82017925e+03 -1.51725305e+01  9.31280521e+02
 -2.29772160e+00  7.35459474e+00 -1.07627356e+01 -7.96756180e-03
  4.11040424e-02 -4.27396058e-02 -1.00382747e+00]

With 19 coefficients, it's quite difficult for users to interpret. We improved the model's R^2 slightly to 0.841.

Using a cubic polynomial model only improved R^2 from 83.8% to 84.1% while it is costly to implement (in terms of computing resources) and harder to explain to non-technical stakeholders, especially when the number of independent variables would be more than 3.

Therefore, we will choose the Quadratic model as the final winner.

## Conclusion

Through EDA, we learned that Age, Smoker and BMI are the three most influential variables in predicting healthcare cost. This is consistent with real life observations.

The quadratic polynomial model is the best among three trained models. Because there is correlation between Smoker and BMI and the quadratic regression model takes into account this relationship, it is more powerful than the linear regression model for prediction purposes. Additionally, the quadratic model is simpler than the cubic model, making it more cost-effective.

Future improvements can be seen by using machine learning models, or by feature engineering.

Thank you for reading!