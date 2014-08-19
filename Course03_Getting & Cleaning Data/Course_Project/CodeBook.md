Code Book
=========
_written by_ Billy.Ljm  
_on 19 August 2014_  

Introduction
------------
This is the codebook for `tidy_data.txt`. 

The various variables are seperated into different sections with their names as the header. Under each section, the description, column number and suggested class for each variable is indicated. There is also a short summary of each variable at the bottom of each section.  

The variables follow a naming convetion which is specified below:  

* __t__ = Time domain signal  
* __f__ = Frequency domain signal _(applied fast fourier transform to the time domain signals)_  
* __Jerk__ = Jerk signal _(time derivatives of the time domain function signals)_
* __bodyAcc__ = Body acceleration  
* __gravityAcc__ = Gravitational acceleration  
* __bodyGyro__ = Body gyro  
* __ _mean __ = Mean of the specifed value
* __ _std __ = Standard deviation of the specified value
* __Mag__ = total magnitude across all 3 axes.
* __ _X __ = in the x-axis
* __ _Y __ = in the y-axis
* __ _Z __ = in the z-axis

***

data$activity 
--------------
__Description:__ Activity carried out while the measurements were taken.  
__Position:__ data[,1]  
__Class:__ factor/character  
```
          Values and labels    N    Percent 
                                            
   1   'WALKING'            1722   16.7 16.7
   2   'WALKING_UPSTAIRS'   1544   15.0 15.0
   3   'WALKING_DOWNSTAIRS' 1406   13.7 13.7
   4   'SITTING'            1777   17.3 17.3
   5   'STANDING'           1906   18.5 18.5
   6   'LAYING'             1944   18.9 18.9
```

data$subject
--------------
__Description:__ Human subject carrying out the specified activity while measurements were taken.  
__Position:__ data[,2]  
__Class:__ factor/integer  
```
   Values and labels   N   Percent
                                  
            1   '1'  347   3.4 3.4
            2   '2'  302   2.9 2.9
            3   '3'  341   3.3 3.3
            4   '4'  317   3.1 3.1
            5   '5'  302   2.9 2.9
            6   '6'  325   3.2 3.2
            7   '7'  308   3.0 3.0
            8   '8'  281   2.7 2.7
            9   '9'  288   2.8 2.8
           10   '10' 294   2.9 2.9
           11   '11' 316   3.1 3.1
           12   '12' 320   3.1 3.1
           13   '13' 327   3.2 3.2
           14   '14' 323   3.1 3.1
           15   '15' 328   3.2 3.2
           16   '16' 366   3.6 3.6
           17   '17' 368   3.6 3.6
           18   '18' 364   3.5 3.5
           19   '19' 360   3.5 3.5
           20   '20' 354   3.4 3.4
           21   '21' 408   4.0 4.0
           22   '22' 321   3.1 3.1
           23   '23' 372   3.6 3.6
           24   '24' 381   3.7 3.7
           25   '25' 409   4.0 4.0
           26   '26' 392   3.8 3.8
           27   '27' 376   3.7 3.7
           28   '28' 382   3.7 3.7
           29   '29' 344   3.3 3.3
           30   '30' 383   3.7 3.7
```

data$tBodyAcc_mean_X
--------------------
__Description:__ Time domain signals of the mean of the body acceleration in the x-axis.  
__Position:__ data[,3]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.274
       Std.Dev.:   0.068
       Skewness:  -3.490
       Kurtosis:  50.595
```

data$tBodyAcc_mean_Y
--------------------
__Description:__ Time domain signals of the mean of the body acceleration in the y-axis.  
__Position:__ Data[,4]  
__Class:__ numeric  
```

            Min:   -1.000
            Max:    1.000
           Mean:   -0.018
       Std.Dev.:    0.037
       Skewness:   -0.429
       Kurtosis:  181.544
```

data$tBodyAcc_mean_Z
--------------------
__Description:__ Time domain signals of the mean of the body acceleration in the z-axis.  
__Position:__ Data[,5]  
__Class:__ numeric  
```

            Min:  -1.000
            Max:   1.000
           Mean:  -0.109
       Std.Dev.:   0.053
       Skewness:   1.759
       Kurtosis:  84.130
```

data$tBodyAcc_std_X
-------------------
__Description:__ Time domain signals of the standard deviation of the body acceleration in the x-axis.  
__Position:__ Data[,6]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.608
       Std.Dev.:   0.439
       Skewness:   0.637
       Kurtosis:  -0.925
```

data$tBodyAcc_std_Y
-------------------
__Description:__ Time domain signals of the standard deviation of the body acceleration in the y-axis.  
__Position:__ Data[,7]  
__Class:__ numeric  
```

            Min:  -1.000
            Max:   1.000
           Mean:  -0.510
       Std.Dev.:   0.500
       Skewness:   0.435
       Kurtosis:  -1.326
```

data$tBodyAcc_std_Z
-------------------
__Description:__ Time domain signals of the standard deviation of the body acceleration in the z-axis.  
__Position:__ Data[,8]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.613
       Std.Dev.:   0.404
       Skewness:   0.661
       Kurtosis:  -0.656
```

data$tGravityAcc_mean_X
-----------------------
__Description:__ Time domain signals of the mean of the gravitational acceleration in the x-axis.  
__Position:__ Data[,9]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.669
       Std.Dev.:   0.515
       Skewness:  -1.629
       Kurtosis:   0.917
```

data$tGravityAcc_mean_Y
-----------------------
__Description:__ Time domain signals of the mean of the gravitational acceleration in the y-axis.  
__Position:__ Data[,10]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.004
       Std.Dev.:   0.379
       Skewness:   1.167
       Kurtosis:   0.406
```

data$tGravityAcc_mean_Z
-----------------------
__Description:__ Time domain signals of the mean of the gravitational acceleration in the z-axis.  
__Position:__ Data[,11]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.092
       Std.Dev.:   0.334
       Skewness:   0.715
       Kurtosis:   0.673
```

data$tGravityAcc_std_X
----------------------
__Description:__ Time domain signals of the standard deviation of the gravitational acceleration in the x-axis.  
__Position:__ Data[,12]  
__Class:__ numeric  
```
            Min:   -1.000
            Max:    1.000
           Mean:   -0.965
       Std.Dev.:    0.078
       Skewness:   11.134
       Kurtosis:  183.961
```

data$tGravityAcc_std_Y
----------------------
__Description:__ Time domain signals of the standard deviation of the gravitational acceleration in the y-axis.  
__Position:__ Data[,13]  
__Class:__ numeric  
```
            Min:   -1.000
            Max:    1.000
           Mean:   -0.954
       Std.Dev.:    0.085
       Skewness:    8.782
       Kurtosis:  123.347
```

data$tGravityAcc_std_Z
----------------------
__Description:__ Time domain signals of the standard deviation of the gravitational acceleration in the z-axis.  
__Position:__ Data[,14]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.939
       Std.Dev.:   0.102
       Skewness:   6.928
       Kurtosis:  76.993
```

data$tBodyAccJerk_mean_X
------------------------
__Description:__ Jerk of the time domain signal of the mean of the body acceleration in the x-axis.  
__Position:__ Data[,15]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.079
       Std.Dev.:   0.176
       Skewness:   0.113
       Kurtosis:   4.727
```

data$tBodyAccJerk_mean_Y
------------------------
__Description:__ Jerk of the time domain signal of the mean of the body acceleration in the y-axis.  
__Position:__ Data[,16]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.008
       Std.Dev.:   0.165
       Skewness:  -0.013
       Kurtosis:   4.818
```

data$tBodyAccJerk_mean_Z
------------------------
__Description:__ Jerk of the time domain signal of the mean of the body acceleration in the z-axis.  
__Position:__ Data[,17]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.005
       Std.Dev.:   0.156
       Skewness:  -0.083
       Kurtosis:   5.262
```

data$tBodyAccJerk_std_X
-----------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the body acceleration in the x-axis.  
__Position:__ Data[,18]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.640
       Std.Dev.:   0.409
       Skewness:   0.665
       Kurtosis:  -0.895
```

data$tBodyAccJerk_std_Y
-----------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the body acceleration in the y-axis.  
__Position:__ Data[,19]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.608
       Std.Dev.:   0.433
       Skewness:   0.643
       Kurtosis:  -0.976
```

data$tBodyAccJerk_std_Z
-----------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the body acceleration in the z-axis.  
__Position:__ Data[,20]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.763
       Std.Dev.:   0.278
       Skewness:   1.050
       Kurtosis:   0.499
```

data$tBodyGyro_mean_X
---------------------
__Description:__ Time domain signal of the mean of the body gyro in the x-axis.  
__Position:__ Data[,21]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.031
       Std.Dev.:   0.183
       Skewness:  -0.159
       Kurtosis:   3.523
```

data$tBodyGyro_mean_Y
---------------------
__Description:__ Time domain signal of the mean of the body gyro in the y-axis.  
__Position:__ Data[,22]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.075
       Std.Dev.:   0.134
       Skewness:   0.194
       Kurtosis:   5.922
```

data$tBodyGyro_mean_Z
---------------------
__Description:__ Time domain signal of the mean of the body gyro in the z-axis.  
__Position:__ Data[,23]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:   0.088
       Std.Dev.:   0.135
       Skewness:  -0.043
       Kurtosis:  10.083
```

data$tBodyGyro_std_X
--------------------
__Description:__ Time domain signal of the standard deviation of the body gyro in the x-axis.  
__Position:__ Data[,24]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.721
       Std.Dev.:   0.301
       Skewness:   0.795
       Kurtosis:  -0.240
```

data$tBodyGyro_std_Y
-------------------
__Description:__ Time domain signal of the standard deviation of the body gyro in the y-axis.  
__Position:__ Data[,25]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.683
       Std.Dev.:   0.357
       Skewness:   0.999
       Kurtosis:   0.270
```

data$tBodyGyro_std_Z
--------------------
__Description:__ Time domain signal of the standard deviation of the body gyro in the z-axis.  
__Position:__ Data[,26]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.654
       Std.Dev.:   0.373
       Skewness:   0.778
       Kurtosis:  -0.207
```

data$tBodyGyroJerk_mean_X
-------------------------
__Description:__ Jerk of the time domain signal of the mean of the body gyro in the x-axis.  
__Position:__ Data[,27]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.097
       Std.Dev.:   0.128
       Skewness:   0.139
       Kurtosis:   6.439
```

data$tBodyGyroJerk_mean_Y
-------------------------
__Description:__ Jerk of the time domain signal of the mean of the body gyro in the y-axis.  
__Position:__ Data[,28]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.042
       Std.Dev.:   0.114
       Skewness:   0.048
       Kurtosis:   8.184
```

data$tBodyGyroJerk_mean_Z
-------------------------
__Description:__ Jerk of the time domain signal of the mean of the body gyro in the z-axis.  
__Position:__ Data[,29]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.055
       Std.Dev.:   0.129
       Skewness:   0.052
       Kurtosis:   6.771
```

data$tBodyGyroJerk_std_X
-------------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the body gyro in the x-axis.  
__Position:__ Data[,30]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.731
       Std.Dev.:   0.304
       Skewness:   0.878
       Kurtosis:  -0.015
```

data$tBodyGyroJerk_std_Y
------------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the body gyro in the y-axis.  
__Position:__ Data[,31]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.786
       Std.Dev.:   0.273
       Skewness:   1.600
       Kurtosis:   3.091
```

data$tBodyGyroJerk_std_Z
------------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the body gyro in the z-axis.  
__Position:__ Data[,32]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.740
       Std.Dev.:   0.302
       Skewness:   0.960
       Kurtosis:   0.269
```

data$tBodyAccMag_mean
---------------------
__Description:__ Time domain signal of the mean of the total body acceleration.  
__Position:__ Data[,33]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.548
       Std.Dev.:   0.467
       Skewness:   0.408
       Kurtosis:  -1.408
```

data$tBodyAccMag_std
--------------------
__Description:__ Time domain signal of the standard deviation of the total body acceleration.  
__Position:__ Data[,34]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.591
       Std.Dev.:   0.429
       Skewness:   0.617
       Kurtosis:  -0.909
```

data$tGravityAccMag_mean
------------------------
__Description:__ Time domain signal of the mean of the total gravitational acceleration.  
__Position:__ Data[,35]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.548
       Std.Dev.:   0.467
       Skewness:   0.408
       Kurtosis:  -1.408
```

data$tGravityAccMag_std
-----------------------
__Description:__ Time domain signal of the standard deviation of the total gravitational acceleration.  
__Position:__ Data[,36]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.591
       Std.Dev.:   0.429
       Skewness:   0.617
       Kurtosis:  -0.909
```

data$tBodyAccJerkMag_mean
-------------------------
__Description:__ Jerk of the time domain signal of the mean of the total body acceleration.  
__Position:__ Data[,37]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.649
       Std.Dev.:   0.389
       Skewness:   0.594
       Kurtosis:  -1.045
```

data$tBodyAccJerkMag_std
------------------------
__Description:__ Jerk of the time domain signal of the standard deviation of the total body acceleration.  
__Position:__ Data[,38]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.628
       Std.Dev.:   0.417
       Skewness:   0.675
       Kurtosis:  -0.868
```

data$tBodyGyroMag_mean
----------------------
__Description:__ Time domain signal of the mean of the total body gyro.  
__Position:__ Data[,39]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.605
       Std.Dev.:   0.400
       Skewness:   0.517
       Kurtosis:  -1.075
```

data$tBodyGyroMag_std
---------------------
__Description:__ Time domain signal of the standard deviation of the total body gyro.  
__Position:__ Data[,40]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.663
       Std.Dev.:   0.349
       Skewness:   0.811
       Kurtosis:  -0.164
```

data$tBodyGyroJerkMag_mean
--------------------------
__Description:__ Time derivative of the mean of the total body gyro.  
__Position:__ Data[,41]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.762
       Std.Dev.:   0.277
       Skewness:   0.986
       Kurtosis:   0.426
```

data$tBodyGyroJerkMag_std
-------------------------
__Description:__ Time derivative of the standard deviation of the total body gyro.  
__Position:__ Data[,42]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.778
       Std.Dev.:   0.272
       Skewness:   1.464
       Kurtosis:   2.538
```

data$fBodyAcc_mean_X
--------------------
__Description:__ Frequency domain signal of the mean of the body acceleration in the x-axis.  
__Position:__ Data[,43]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.623
       Std.Dev.:   0.421
       Skewness:   0.618
       Kurtosis:  -0.989
```

data$fBodyAcc_mean_Y
--------------------
__Description:__ Frequency domain signal of the mean of the body acceleration in the y-axis.  
__Position:__ Data[,44]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.537
       Std.Dev.:   0.482
       Skewness:   0.493
       Kurtosis:  -1.231
```

data$fBodyAcc_mean_Z
--------------------
__Description:__ Frequency domain signal of the mean of the body acceleration in the z-axis.  
__Position:__ Data[,45]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.665
       Std.Dev.:   0.359
       Skewness:   0.736
       Kurtosis:  -0.474
```

data$fBodyAcc_std_X
-------------------
__Description:__ Frequency domain signal of the standard deviation of the body acceleration in the x-axis.  
__Position:__ Data[,46]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.603
       Std.Dev.:   0.447
       Skewness:   0.676
       Kurtosis:  -0.811
```

data$fBodyAcc_std_Y
-------------------
__Description:__ Frequency domain signal of the standard deviation of the body acceleration in the y-axis.  
__Position:__ Data[,47]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.528
       Std.Dev.:   0.480
       Skewness:   0.443
       Kurtosis:  -1.297
```

data$fBodyAcc_std_Z
-------------------
__Description:__ Frequency domain signal of the standard deviation of the body acceleration in the z-axis.  
__Position:__ Data[,48]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.618
       Std.Dev.:   0.399
       Skewness:   0.715
       Kurtosis:  -0.473
```

data$fBodyAccJerk_mean_X
------------------------
__Description:__ Jerk of the frequency domain signal of the mean of the body acceleration in the x-axis.  
__Position:__ Data[,49]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.657
       Std.Dev.:   0.390
       Skewness:   0.690
       Kurtosis:  -0.814
```

data$fBodyAccJerk_mean_Y
------------------------
__Description:__ Jerk of the frequency domain signal of the mean of the body acceleration in the y-axis.  
__Position:__ Data[,50]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.629
       Std.Dev.:   0.407
       Skewness:   0.635
       Kurtosis:  -0.983
```

data$fBodyAccJerk_mean_Z
------------------------
__Description:__ Jerk of the frequency domain signal of the mean of the body acceleration in the z-axis.  
__Position:__ Data[,51]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.744
       Std.Dev.:   0.298
       Skewness:   1.041
       Kurtosis:   0.490
```

data$fBodyAccJerk_std_X
-----------------------
__Description:__ Jerk of the frequency domain signal of the standard deviation of the body acceleration in the x-axis.  
__Position:__ Data[,52]  
__Class:__ numeric  
```

            Min:  -1.000
            Max:   1.000
           Mean:  -0.655
       Std.Dev.:   0.393
       Skewness:   0.675
       Kurtosis:  -0.870
```

data$fBodyAccJerk_std_Y
-----------------------
__Description:__ Jerk of the frequency domain signal of the standard deviation of the body acceleration in the y-axis.  
__Position:__ Data[,53]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.612
       Std.Dev.:   0.434
       Skewness:   0.687
       Kurtosis:  -0.863
```

data$fBodyAccJerk_std_Z
-----------------------
__Description:__ Jerk of the frequency domain signal of the standard deviation of the body acceleration in the z-axis.  
__Position:__ Data[,54]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.781
       Std.Dev.:   0.260
       Skewness:   1.109
       Kurtosis:   0.735
```

data$fBodyGyro_mean_X
---------------------
__Description:__ Frequency domain signal of the mean of the body gyro in the x-axis.  
__Position:__ Data[,55]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.672
       Std.Dev.:   0.351
       Skewness:   0.740
       Kurtosis:  -0.377
```

data$fBodyGyro_mean_Y
---------------------
__Description:__ Frequency domain signal of the mean of the body gyro in the y-axis.  
__Position:__ Data[,56]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.706
       Std.Dev.:   0.336
       Skewness:   1.072
       Kurtosis:   0.644
```

data$fBodyGyro_mean_Z
---------------------
__Description:__ Frequency domain signal of the mean of the body gyro in the z-axis.  
__Position:__ Data[,57]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.644
       Std.Dev.:   0.382
       Skewness:   0.699
       Kurtosis:  -0.592
```

data$fBodyGyro_std_X
--------------------
__Description:__ Frequency domain signal of the standard deviation of the body gyro in the x-axis.  
__Position:__ Data[,58]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.739
       Std.Dev.:   0.286
       Skewness:   0.869
       Kurtosis:  -0.017
```

data$fBodyGyro_std_Y
--------------------
__Description:__ Frequency domain signal of the standard deviation of the body gyro in the y-axis.  
__Position:__ Data[,59]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.674
       Std.Dev.:   0.370
       Skewness:   1.075
       Kurtosis:   0.536
```

data$fBodyGyro_std_Z
--------------------
__Description:__ Frequency domain signal of the standard deviation of the body gyro in the z-axis.  
__Position:__ Data[,60]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.690
       Std.Dev.:   0.337
       Skewness:   0.892
       Kurtosis:   0.281
```

data$fBodyAccMag_mean
---------------------
__Description:__ Frequency domain signal of the mean of the total body acceleration.  
__Position:__ Data[,61]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.586
       Std.Dev.:   0.445
       Skewness:   0.653
       Kurtosis:  -0.840
```

data$fBodyAccMag_std
--------------------
__Description:__ Frequency domain signal of the standard deviation of the total body acceleration.  
__Position:__ Data[,62]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.660
       Std.Dev.:   0.355
       Skewness:   0.652
       Kurtosis:  -0.788
```

data$fBodyBodyAccJerkMag_mean
-----------------------------
__Description:__ Jerk of the frequency domain signal of the mean of the total body acceleration.  
__Position:__ Data[,63]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.621
       Std.Dev.:   0.425
       Skewness:   0.680
       Kurtosis:  -0.838
```

data$fBodyBodyAccJerkMag_std
----------------------------
__Description:__ Jerk of the frequency domain signal of the standard deviation of the total body acceleration.  
__Position:__ Data[,64]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.640
       Std.Dev.:   0.406
       Skewness:   0.725
       Kurtosis:  -0.751
```

data$fBodyBodyGyroMag_mean
--------------------------
__Description:__ Frequency domain signal of the mean of the total body gyro.  
__Position:__ Data[,65]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.697
       Std.Dev.:   0.324
       Skewness:   0.897
       Kurtosis:   0.159
```

data$fBodyBodyGyroMag_std
-------------------------
__Description:__ Frequency domain signal of the standard deviation of the total body gyro.  
__Position:__ Data[,66]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.700
       Std.Dev.:   0.310
       Skewness:   0.897
       Kurtosis:   0.199
```

data$fBodyBodyGyroJerkMag_mean
------------------------------
__Description:__ Jerk of the frequency domain signal of the mean of the total body gyro.  
__Position:__ Data[,67]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.780
       Std.Dev.:   0.268
       Skewness:   1.398
       Kurtosis:   2.194
```

data$fBodyBodyGyroJerkMag_std
-----------------------------
__Description:__ Jerk of the frequency domain signal of the standard deviation of the total body gyro.  
__Position:__ Data[,68]  
__Class:__ numeric  
```
            Min:  -1.000
            Max:   1.000
           Mean:  -0.792
       Std.Dev.:   0.259
       Skewness:   1.619
       Kurtosis:   3.382
```