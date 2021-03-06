# Population Health & Economic Costs of<br>Severe Weather Events
*by* **Billy Lim Jun Ming**  
*Saturday, August 23, 2014*

### Note
This report was done as part of the [Reproducible Research MOOC][1] by 
John Hopkins School of Public Health. Do note that that because of this, 
the data used is a cached copy of the original storm data and it is 
hosted on a different domain.  


## Synopsis
### Aim
This report aims to compare the costs of severe weather events, in the United States, throughout 2005 to 2001, and identify the most destructive severe weather eventin terms of the extent of harm to population health and economic damage.  

### Hypothesis
The hypothesis is that sleet causes the most harm to population health while tornadoes causes the most economic damage. This is because sleet occurs frequently and people are generally more complacent about sleet, resulting in more accidents due to sleet. Tornadoes, on the other hand, are able to destroy several properties across large areas and tornadoes occur relatively frequently in the United states, especially given its destructiveness.  

### Results
To test the hypothesis, we obtained storm data from the National Oceanic and Atmosphere Administration from 1950 - 2011. 

From the data, we found that tornadoes cause the most harm to population health. It is surprising that so many are hurt from tornadoes despite the several precautionary measures in place in the event of storms. This suggests such precautionary measures are inadequate, perhaps due to the storm warnings being activated far too late or because there are insufficient storm shelters in homes and public places.  

For economic damage, floods were found to be the single most destructive event. However, storm-related events such as hurricanes, tornadoes and storm surges are still found to cause more economic damage when combined together. This suggests that perhaps we should slowly start encouraging flood-proofing buildings on top of storm-proofing them.


## Data Processing
### Downloading Data
The storm data was obtained from [here][2] and then renamed to `StormData.csv.bz2`.  
The documentation for the data can be obtained from [here][3] while a FAQ page can be found [here][4].  

### Tidying Data
The 3rd-party R packages that are used are as follows:  

```r
require(data.table)
require(ggplot2)
require(gridExtra)
```

First, I read in the header of the data to decide which rows are relevant. This is for faster reading later as the file is quite large.  

```r
header <- read.csv("StormData.csv.bz2", na.strings="", nrows = 1)
names(header)
```

```
##  [1] "STATE__"    "BGN_DATE"   "BGN_TIME"   "TIME_ZONE"  "COUNTY"    
##  [6] "COUNTYNAME" "STATE"      "EVTYPE"     "BGN_RANGE"  "BGN_AZI"   
## [11] "BGN_LOCATI" "END_DATE"   "END_TIME"   "COUNTY_END" "COUNTYENDN"
## [16] "END_RANGE"  "END_AZI"    "END_LOCATI" "LENGTH"     "WIDTH"     
## [21] "F"          "MAG"        "FATALITIES" "INJURIES"   "PROPDMG"   
## [26] "PROPDMGEXP" "CROPDMG"    "CROPDMGEXP" "WFO"        "STATEOFFIC"
## [31] "ZONENAMES"  "LATITUDE"   "LONGITUDE"  "LATITUDE_E" "LONGITUDE_"
## [36] "REMARKS"    "REFNUM"
```

As can be seen above, the columns relevant to our purposes are `EVTYPE`, `FATALITIES`, `INJURIES`, `PROPDMG`, `PROPDMGEXP`, `CROPDMG`, `CROPDMGEXP`. EVTYPE stand for event type while PROPDMG and CROPDMG stands for property and crop damage. The PROPDMGEXP and CROPDMGEXP stands for the exponential for their respective damage. Thus, I read only the above-mentioned columns in via the code below.

```r
relCols <- c("EVTYPE","FATALITIES","INJURIES","PROPDMG","PROPDMGEXP","CROPDMG","CROPDMGEXP")
colIndx <- ifelse(names(header) %in% relCols, "character", "NULL")
data <- read.csv("StormData.csv.bz2", na.strings="", colClasses=colIndx)
data <- data.table(data)
head(data)
```

```
##     EVTYPE FATALITIES INJURIES PROPDMG PROPDMGEXP CROPDMG CROPDMGEXP
## 1: TORNADO       0.00    15.00   25.00          K    0.00         NA
## 2: TORNADO       0.00     0.00    2.50          K    0.00         NA
## 3: TORNADO       0.00     2.00   25.00          K    0.00         NA
## 4: TORNADO       0.00     2.00    2.50          K    0.00         NA
## 5: TORNADO       0.00     2.00    2.50          K    0.00         NA
## 6: TORNADO       0.00     6.00    2.50          K    0.00         NA
```

For the `DMGEXP`, `K` means thousand, `M` is million and `B` is Billion. However, as seen below, there are some unusual values. I assume the lower-case letters are similar to their upper-case counterparts. As for the rest I chose to ignore such entries as they do not seem to mean anything & they comprise only a small proportion of all the entries.  


```r
summary(factor(data$PROPDMGEXP))
```

```
##      -      ?      +      0      1      2      3      4      5      6 
##      1      8      5    216     25     13      4      4     28      4 
##      7      8      B      h      H      K      m      M   NA's 
##      5      1     40      1      6 424665      7  11330 465934
```

```r
summary(factor(data$CROPDMGEXP))
```

```
##      ?      0      2      B      k      K      m      M   NA's 
##      7     19      1      9     21 281832      1   1994 618413
```

I then used the above-mentioned assumption and merged the `DMG` & `DMGEXP`

```r
# Change Property Damage Exponential to numeric equivalent
data$PROPDMGEXPNUM <- NA
data$PROPDMGEXPNUM[data$PROPDMGEXP == "K" | data$PROPDMGEXP == "k"] <-  1e3
data$PROPDMGEXPNUM[data$PROPDMGEXP == "M" | data$PROPDMGEXP == "m"] <-  1e6
data$PROPDMGEXPNUM[data$PROPDMGEXP == "B" | data$PROPDMGEXP == "b"] <-  1e9

# Change Crop Damage Exponential to numeric equivalent
data$CROPDMGEXPNUM <- NA
data$CROPDMGEXPNUM[data$CROPDMGEXP == "K" | data$CROPDMGEXP == "k"] <-  1e3
data$CROPDMGEXPNUM[data$CROPDMGEXP == "M" | data$CROPDMGEXP == "m"] <-  1e6
data$CROPDMGEXPNUM[data$CROPDMGEXP == "B" | data$CROPDMGEXP == "b"] <-  1e9

# Calculate Total Damage to Property & Crop
data$PROPDMG <- as.numeric(data$PROPDMG) * data$PROPDMGEXPNUM
data$CROPDMG <- as.numeric(data$CROPDMG) * data$CROPDMGEXPNUM
```

I also did some clean-up.

```r
# Clean-up useless columns
data$PROPDMGEXP <- NULL
data$CROPDMGEXP <- NULL
data$PROPDMGEXPNUM <- NULL
data$CROPDMGEXPNUM <- NULL

# Column classes (note that DMG are already nuemric from above)
data$EVTYPE <- as.factor(data$EVTYPE)
data$FATALITIES <- as.numeric(data$FATALITIES)
data$INJURIES <- as.numeric(data$INJURIES)
```

Next, the data is aggregated by `Event` and the total economic damage calculated.  

```r
data <- data[,lapply(.SD, sum, na.rm=TRUE), by=EVTYPE]
data$TOTALDMG <- rowSums(data[,list(PROPDMG,CROPDMG)], na.rm=TRUE)
head(data)
```

```
##                   EVTYPE FATALITIES INJURIES   PROPDMG   CROPDMG  TOTALDMG
## 1:               TORNADO       5633    91346 5.694e+10 4.150e+08 5.735e+10
## 2:             TSTM WIND        504     6957 4.485e+09 5.540e+08 5.039e+09
## 3:                  HAIL         15     1361 1.573e+10 3.026e+09 1.876e+10
## 4:         FREEZING RAIN          7       23 8.112e+06 0.000e+00 8.112e+06
## 5:                  SNOW          5       29 1.476e+07 1.000e+04 1.477e+07
## 6: ICE STORM/FLASH FLOOD          0        2 0.000e+00 0.000e+00 0.000e+00
```

The data is now completely tidied for our purpose. Only plotting remains to help interpret the data, and it is continued in the next section.


## Results
### Population Health
The first aim of this report is to determine which severe weather event causes the most harm to population health, which I decided to measure via fatality and injury count. I chose to plot bar graphs of the 10 severe weather event with the highest fatality count and 10 with the highest injury count.  


```r
# Get top 8 weather events
data_fatalities <- data[order(-data$FATALITIES),][1:10,]
data_injuries <- data[order(-data$INJURIES),][1:10,]

# Plot each graph
plot_fatalities <- ggplot(data_fatalities, aes(x=reorder(EVTYPE,-FATALITIES), y=FATALITIES)) +
	geom_bar(stat="identity") + xlab("") + ylab("Fatalities") +
	theme(axis.text.x = element_text(angle = 45, hjust = 1))
plot_injuries <- ggplot(data_injuries, aes(x=reorder(EVTYPE, -INJURIES), y=INJURIES)) +
	geom_bar(stat="identity") + xlab("") + ylab("Injuries") +
	theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print plot
grid.arrange(plot_fatalities, plot_injuries, ncol=2, 
			 main="Number of Fatalities and Injuries due to Severe Weather Events")
```

<img src="figure/popHealth.png" title="plot of chunk popHealth" alt="plot of chunk popHealth" style="display: block; margin: auto;" />

As can be seen from the plot above, tornadoes cause both the most fatalities and the most injuries by an immense margin. Thus, I conclude that tornadoes are the severe weather event which causes the most harm to population health.  

### Economic Damage
The second aim of this report is to determine which severe weather event causes the most economic damage, which I decided to measure via the sum of the property andcrop damage. The plot the 10 severe weather event with the highest total damage is below. The cost is also seperated into property and crop damge.  


```r
# Get top 8 weather events
data_totalDmg <- data[order(-data$TOTALDMG),][1:10,]

# Plot graph
plot_totalDmg <- ggplot(data_totalDmg, aes(x=reorder(EVTYPE, -TOTALDMG))) + 
	geom_bar(aes(y=PROPDMG/1e9, fill="Property Damage"), stat="identity") + 
	geom_bar(aes(y=CROPDMG/1e9, fill="Crop Damage"), stat="identity") + 
	scale_fill_manual(values = c("#E69F00","#56B4E9"), name="Legend") + 
	xlab("") + ylab("Damage (billion US$)") + 
	ggtitle("Economic Costs of Severe Weather Events") +
	theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print plot
plot_totalDmg
```

<img src="figure/econDmg.png" title="plot of chunk econDmg" alt="plot of chunk econDmg" style="display: block; margin: auto;" />

We can infer for the plot that floods cause the greatest total economic damage out of all the severe weather events. However, it must be noted that the next 3 most destructive events are storm-related. And together, the economic damage caused by these storm-related events are higher than those caused by floods.

[1]: https://www.coursera.org/course/repdata "MOOC website"
[2]: https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2 "Storm Data"
[3]: https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf "Data Documentation"
[4]: https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2FNCDC%20Storm%20Events-FAQ%20Page.pdf "Data FAQ"
