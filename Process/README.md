<!-- PROCESS -->
# Process

## Case Study Roadmap
Guiding Questions
- What tools are you choosing and why?
- Have you ensured your data’s integrity?
- What steps have you taken to ensure that your data is clean?
- How can you verify that your data is clean and ready to analyze?
- Have you documented your cleaning process so you can review and share those results?

Key tasks
1. Check the data for errors. 
2. Choose your tools. 
3. Transform the data so you can work with it effectively. 
4. Document the cleaning process.

Deliverable
- Documentation of any cleaning or manipulation of data

## Cleaning and transform

First thing i did was to check if the data type and column name is consistent throughout the dataset

```sh
# R Studio
# Process
## Loading libraries
install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(ggplot2)

## Find out if column name and type is consistent
str(apr_22)
str(may_22)
str(jun_22)
str(jul_22)
str(aug_22)
str(sep_22)
str(oct_22)
str(nov_22)
str(dec_22)
str(jan_23)
str(feb_23)
str(mar_23)
```

![Data Consistency](https://github.com/brucewzj99/data-analytics-casestudy/tree/main/images/check-consistency.png)

This was the output, as you can see, the data type and column is consistent.

<p align="right">(<a href="https://github.com/brucewzj99/data-analytics-casestudy/tree/master/share">next | share</a>)</p>