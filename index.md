---
title       : Body-Mass-Index based obesity classification
subtitle    : BMI computation and obesity level classification according to the WHO
author      : joergandi
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Executive Summary

* Weight-related health issues are a growing problem worldwide. 
* One step towards addressing this problem is to raise awareness of the problem.
* The proposed shiny web application allows users to 
 + self-assess their weight,
 + receive immediate feedback.
* This is done by 
 + computing the so-called body-mass-index,
 + classifying this index into obesity levels according to WHO guidelines.

--- .class #id 

## Approach (1)

### Body-Mass-Index

* In order to classify the provided user weight, the app computes the BMI.
* The BMI (Body-Mass-Index) is an index suggested in [Indices of relative weight and obesity](https://dx.doi.org/10.1016%2F0021-9681%2872%2990027-6).
* It is computed as shown in the following example:

```r
weight<-75 #kg
height<-1.75 #m
bmi<-weight/(height*height)
bmi
```

```
## [1] 24.4898
```
* Note that the universal applicability of the BMI is disputed, cf. [this article](http://www.npr.org/templates/story/story.php?storyId=106268439)

--- .class #id 

## Approach (2)

### Obesity classification

* Based on the computed BMI, the provided user weight is classified into different obesity levels.
* The classification is based on [WHO recommendations](http://www.who.int/bmi/index.jsp?introPage=intro_3.html)

Classification | BMI
-------------- | ----
Underweight | <18.5
Normal | 18.5 - 25
Overweight | 25 - 30
Obese | >30

* To underline dangerous weight conditions, the classification output will be shown in red if the normal BMI range has been left.

--- .class #id

## Unit system conversion

* To extend the reach of the app, both metric and US units are supported.
* Weight can be input in
 + kilograms (kg)
 + pounds (lbs), which will be converted internally with a factor of 2.205 lbs per kg
* Height can be input in
 + centimeters (cm)
 + inches (in), which will be converted internally with a factor of 2.54 cm per inch

