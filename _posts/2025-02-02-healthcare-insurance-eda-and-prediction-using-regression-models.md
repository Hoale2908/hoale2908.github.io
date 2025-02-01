---
layout: post_layout
title: "Healthcare Insurance - EDA and Cost Prediction using Regression Models"
date: 2025-02-02
tags: [python, data analysis, regression, scikit-learn]
images:
  - assets/img/healthcare-cost.jpg
---

Predicting healthcare costs for individuals is important for various stakeholders beyond health insurers, and for various purposes. A few notable benefits of accurately predicting healthcare costs for insurance companies are determining fair and competitive premium rates, personalizing insurance plans, and optimizing resource allocation.

This notebook aims to find out how healthcare costs are driven by different variables by visualizing their relationships, and developing models to predict healthcare costs. 

The dataset contains demographic and health information and healthcare cost of 1,338 patients, including age, gender, BMI score, number of children, smoking status, and region (location).

To view the full notebook, [click here](https://github.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/blob/main/code.ipynb).

## Executive Summary  
 - Exploratory Data Analysis shows that Age, BMI, and Smoking status have impacts on healthcare cost (Charges).
 - Based on these 3 independent variables -- Age, BMI and Smoking status, polynomial regression models are trained at the degrees of 1, 2, and 3 (i.e. linear, quadratic, and cubic) to predict healthcare cost, and evaluated using $R^2$. 
 - Quadratic polynomial model has the highest power of explanation for healthcare cost, with $R^2=84%$. 


## Insights from EDA  
 

![smoking](https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___13_0.png)

![heatmap](https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___16_0.png)

![age](https://www.kaggleusercontent.com/kf/220315349/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..x5iwbCXsePY2NSWay9FPWQ.CEuUpIazfDstwWgagDyk3jyRIzKNPDUbwA4JIIma-FL4fFcPmeLUobKTI1maDu92vI8doam7ZXINX-z1cwmsWIfxhLvCxZhbMqtCGrOTxeeMbbkIQX9YFay4sXJ7XrRDsDeXuwXb1OeTZAFeSS1AmYObUzl3A8ed4PrhRRfO30UXdzh8Y3NoDksLMpaMxLpxOPeCRg7Mt5am-F-QuFm6dGod4JeEKel5tuLdLEYi4gHMeBHY7KF-xcpW1to8WWWsS7xaud_UC4147HDp6R6iCeItAHWglC79OhK52hVDfJfU4usS6zLHgKBSkmDvtT-P64LMtOms-nB27cG2bELEEHo_qet1aKkgHzUBlqZNZE7sMCNIddniCRqnkytGPmIp5sMPQbf9OVhYE5zeGNbgZQ1W-Hxwk1nQYmQR5vz3AncZZ1Ct663Iu42RmaGtfyptXvV7jMviWie_uXyGIPDWxySA9pn_eb6Lsyx_UKEkvs3ke7IdTPzpDRPCN1Ic2gFDiHR3RHRr1LcRtQb5gZplaeMk1N2DG7PjH-9BV2WboX03_sYcE3L_OZu7D9bklTXFLJDlpKOOva-7DGP3U10TK9xdfSBxJtd7KaUt7o9csl3ITIsDOX9Oq5lWwi4gHpXD8hOI5IHR_NnToE59JaMIsiv6ow_lSsq5UrE8sgCvoGc.GG4IjMAvxJgr_z9MNgZ6Ag/__results___files/__results___21_0.png)

 
- Smoking and BMI affect healthcare costs. 
  - Smokers have higher healthcare costs than non-smokers.
  - Among smokers, people with higher BMI incur higher healthcare costs.
- Age affects healthcare costs, with older people have higher costs than younger people.
- Location and gender do not significantly affect healthcare costs.
- People with more children consist of mainly non-smokers. The causal relationship between the number of children and smoking status, or vice versa, cannot be determined through this dataset.

## Model development and evaluation