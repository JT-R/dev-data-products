---
title : Predictive model for the volume of a tree
subtitle : based on the 'trees' dataset
author : Jakub Tomaszewski
job : Developing Data Products PA project
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit : slidify::knit2slides
---

#### Introduction: 'trees' dataset
- Consists of 31 observations and 3 attributes describing size of the given tree.


```r
head(trees,2)
```

```
##   Girth Height Volume
## 1   8.3     70   10.3
## 2   8.6     65   10.3
```

```r
rbind(Mean=apply(trees,2,mean),Min=apply(trees,2,min),Max=apply(trees,2,max))
```

```
##      Girth Height Volume
## Mean 13.25     76  30.17
## Min   8.30     63  10.20
## Max  20.60     87  77.00
```
- It could be interesting to find the model explaining the functional relationships between these variables.

--- .class #id

## How does it look like

<img src="C:\Users\Kuba1\Desktop\Dropbox\Coursera_edX\Developing_Data_Products\shiny_app\example.png" height="359px" width="1024px" />

On the image above we can see an exemplary appearance of the app.

Settings selected in the checkboxes and sliders in the left panel determine how the graph on the right looks like.

--- 

## Features

<b>Trees_model_app</b> has interactive user interface, which allows the user to perform the following actions:

- Choice of the predictor used in the model.
- Control of the confidence level for confidence intervals on the plot.
- Number of observations in the data can be changed (i.e. to check how the width of confidence intervals depends on size of the data).
- Adjustment of the plot with checkboxes (show/hide options):
    1. Grid;
    2. Line fitted by the model;
    3. Curves corresponding to the borders of confidence intervals for the fitted values.

---

## Links and sources

### Shiny

<b>Trees_model_app</b> was implemented in R using Shiny web application framework: http://shiny.rstudio.com. 

### Github repository with source code of the app:
<b>https://github.com/JT-R/dev-data-products</b>
- <i>server.R</i> is responsible for server-side calculations (i.e. model construction);
- <i>ui.R</i> handles the user interface of this app.

### Source code of this presentation:
<b>https://github.com/JT-R/dev-data-products/slidify_presentation.Rmd</b>
