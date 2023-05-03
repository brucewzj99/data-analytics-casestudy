<!-- PREPARE -->
# Prepare

## Case Study Roadmap
Guiding Questions
- Where is your data located? 
- How is the data organized? 
- Are there issues with bias or credibility in this data? Does your data ROCCC? 
- How are you addressing licensing, privacy, security, and accessibility? 
- How did you verify the data’s integrity? 
- How does it help you answer your question? 
- Are there any problems with the data?

Key tasks
1. Download data and store it appropriately. 
2. Identify how it’s organized. 
3. Sort and filter the data.
4. Determine the credibility of the data.

Deliverable
- A description of all data sources used

## Data source
The data source is acquired from [divvy-bikes](https://divvy-tripdata.s3.amazonaws.com/index.html) made available by Motivate International Inc. under this [licence](https://ride.divvybikes.com/data-license-agreement). Due to data-privacy issues, the data prohibits anyone from using riders’ personally identifiable information. This means that I won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

For the prepare phase, I will be using datasets from March 2022 to February 2023.
<details>
<summary>Datasets <i>(Retrieve 1 May 2023)</i>:</summary>
<ul>
  <li>202203-divvy-tripdata.zip</li>
  <li>202204-divvy-tripdata.zip</li>
  <li>202205-divvy-tripdata.zip</li>
  <li>202206-divvy-tripdata.zip</li>
  <li>202207-divvy-tripdata.zip</li>
  <li>202208-divvy-tripdata.zip</li>
  <li>202209-divvy-tripdata.zip</li>
  <li>202210-divvy-tripdata.zip</li>
  <li>202211-divvy-tripdata.zip</li>
  <li>202212-divvy-tripdata.zip</li>
  <li>202201-divvy-tripdata.zip</li>
  <li>202302-divvy-tripdata.zip</li>
</ul>
</details>


After downloading and extracting all the files, “202209-divvy-publictripdata.csv” was not named the same as the other files in this convention “[date]-divvy-publictripdata.csv”. Hence was renamed to “202209-divvy-tripdata.csv”. 

The tripdata is then imported over to R Studio

```sh
# Prepare
## Loading csv files into environment
apr_22 <- read.csv("202204-divvy-tripdata.csv")
may_22 <- read.csv("202205-divvy-tripdata.csv")
jun_22 <- read.csv("202206-divvy-tripdata.csv")
jul_22 <- read.csv("202207-divvy-tripdata.csv")
aug_22 <- read.csv("202208-divvy-tripdata.csv")
sep_22 <- read.csv("202209-divvy-tripdata.csv")
oct_22 <- read.csv("202210-divvy-tripdata.csv")
nov_22 <- read.csv("202211-divvy-tripdata.csv")
dec_22 <- read.csv("202212-divvy-tripdata.csv")
jan_23 <- read.csv("202301-divvy-tripdata.csv")
feb_23 <- read.csv("202302-divvy-tripdata.csv")
mar_23 <- read.csv("202303-divvy-tripdata.csv")
```

<p align="right">(<a href="https://github.com/brucewzj99/data-analytics-casestudy/tree/main/process">next | process</a>)</p>