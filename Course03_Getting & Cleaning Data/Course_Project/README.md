# Course Project: Tidy Data Set  
*done by* Billy.Ljm  
*on 19 August 2014*


## Description
This is an assignment test our ability to tidy up a real-life raw data set.  
It involves digesting the provided documentation & combining various information from several files, some of 
which are not relevant to our purpose.  
The raw data can be download from [here][1]. It's too large to upload onto github.  
[1]: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The instructions are as below:  

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

The 5th step is to produce a smaller data set which can be easily be uploaded to coursera for peer grading, 
and it is this smaller data set which is saved in `tidy_data.txt`. The full tidy data set is not saved in 
any file, but it is created as a variable `data` in the script for those interested. 

## Files
`run_analysis.R` - R script to tidy up the raw data from the zip file & save the tidy set to `tidy_set.txt`  
`tidy_set.txt` - Tidy data set _(use read.table to read data set into R)_  
`CodeBook.md` - Code book for the tidy data  
`UCI HAR Dataset.zip` - The raw data set  

## Description of Analysis
The main measurements were split into 3 parts. The training set is in `X_train.txt`, the test set is in 
`X_test.txt` and the headers are in `features.txt`. Additionally, we had to filter out only the mean & 
standard deviation measurements from the various other measurements. 

In order to not waste run-time reading irrelevant columns, I first obtained the column numbers of the desired 
measurements by determining if the measurement headers have `mean()` or `std()` *(step 2)*. Afterwhich, I 
used the column numbers to read the desired columns of the training & test set of the main measurements and 
rbind-ed them *(step 1)*. As for the headers, I removed the "-" & "()", which doesn't play well with certain 
functions, before merging them with the rest of the data. *(step 4)*

In addition to the main measurements, there were also "subject" variables which were stored in 
`subject_train.txt` & `subject_test.txt`. I simply rbind-ed the 2 files before cbind-ing the "subject" 
variable to the main data.  

Fianlly, the "acitivity" variables were stored in `y_train.txt` & `y_test.txt` with its factor map in 
`activity label.txt`. I rbind-ed the 2 files, converted it to factors and then used the `levels()` function 
to edit the factor mapping according to `activity label.txt` *(step3)*. After this, cbind-ed the "activity" 
variables to the main data.

At this point, the full tidy data set is created which:

1. Contains data from the training & test sets
2. Only contains mean & standard deviation
3. Has the activity varaible as a factor with appropriate descriptive labesl
4. Has descriptive variable names in a form based on but slightly edited from the raw data

As for step 5, I aggregated the data by the activity & subject labels before writing the smaller data set 
to `tidy_data.txt`.