---
title: "run_analysis.R"
author: "Raj Somne"
date: "November 21, 2015"
output: html_document
---

Overview :

This script follows steps to clean the source data and creates a tidy dataset for analysis to be performed later.

It uses library - reshape2 for melting and dcasting the data tables for required outcome.

Full description of the source data for "Human Activity Recognition Using Smartphone" can be found at the site - <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The source data is dowloaded from :
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

It is assumed that the data is downloaded from the link above, unzipped and stored in the workspace folder without changing names of folders or files. The script "run_analyis.R" should be also stored in the same workspace folder.

Data Cleaning Steps:

-   Data for activity_lables and features is loaded from files activity_labels.txt & features.txt into dataframes
-   Only subset is retrieved from features by checking feature description containg strings "mean" or "std"
-   Feature names are cleaned up by substituting meaningful names
-   Train dataset is loaded into data frames from X_train.txt, Y-train.txt & subject_train.txt files and combined into one big dataset using cbind() function.
-   Test dataset is loaded into data frames from X_test.txt, Y-test.txt & subject_test.txt files and combined into one big dataset using cbind() function.
-   Both the train and test datasets are then merged into mergedData using rbind() function and proper column names are assigned.
-   Both subject and activities are converted into factors so that they can be used in reshaping the data.
-   MergedData is then reshaped into long format using melt() function
-   MergedData is then converted into wide format and mean value of each variable is calculated for each subject and activity
-   Finally, the tidy data set is outputed into a file "average_data.txt".  The file contains rows 180 observation-rows (30 subjects * 6 activities) and 81 variables including subject and activity.  It includes all variable measurements for mean and std including 'MeanFreq'



Details of Variables in tidy data (average_data.txt):

Activity contains 6 levels:
```{r}
1       WALKING
2       WALKING_UPSTAIRS
3       WALKING_DOWNSTAIRS
4       SITTING
5       STANDING
6       LAYINGS  
```

key identifiers for measurements are:
```{r}
 [1] "subject"  - The ID of the test subject
 [2] "activity" - The type of activity performed for the measurement
```

Measurements:
```{r}
 [3] "tBodyAccMeanX"               
 [4] "tBodyAccMeanY"               
 [5] "tBodyAccMeanZ"               
 [6] "tBodyAccStdDevX"             
 [7] "tBodyAccStdDevY"             
 [8] "tBodyAccStdDevZ"             
 [9] "tGravityAccMeanX"            
[10] "tGravityAccMeanY"            
[11] "tGravityAccMeanZ"            
[12] "tGravityAccStdDevX"          
[13] "tGravityAccStdDevY"          
[14] "tGravityAccStdDevZ"          
[15] "tBodyAccJerkMeanX"           
[16] "tBodyAccJerkMeanY"           
[17] "tBodyAccJerkMeanZ"           
[18] "tBodyAccJerkStdDevX"         
[19] "tBodyAccJerkStdDevY"         
[20] "tBodyAccJerkStdDevZ"         
[21] "tBodyGyroMeanX"              
[22] "tBodyGyroMeanY"              
[23] "tBodyGyroMeanZ"              
[24] "tBodyGyroStdDevX"            
[25] "tBodyGyroStdDevY"            
[26] "tBodyGyroStdDevZ"            
[27] "tBodyGyroJerkMeanX"          
[28] "tBodyGyroJerkMeanY"          
[29] "tBodyGyroJerkMeanZ"          
[30] "tBodyGyroJerkStdDevX"        
[31] "tBodyGyroJerkStdDevY"        
[32] "tBodyGyroJerkStdDevZ"        
[33] "tBodyAccMagMean"             
[34] "tBodyAccMagStdDev"           
[35] "tGravityAccMagMean"          
[36] "tGravityAccMagStdDev"        
[37] "tBodyAccJerkMagMean"         
[38] "tBodyAccJerkMagStdDev"       
[39] "tBodyGyroMagMean"            
[40] "tBodyGyroMagStdDev"          
[41] "tBodyGyroJerkMagMean"        
[42] "tBodyGyroJerkMagStdDev"      
[43] "fBodyAccMeanX"               
[44] "fBodyAccMeanY"               
[45] "fBodyAccMeanZ"               
[46] "fBodyAccStdDevX"             
[47] "fBodyAccStdDevY"             
[48] "fBodyAccStdDevZ"             
[49] "fBodyAccMeanFreqX"           
[50] "fBodyAccMeanFreqY"           
[51] "fBodyAccMeanFreqZ"           
[52] "fBodyAccJerkMeanX"           
[53] "fBodyAccJerkMeanY"           
[54] "fBodyAccJerkMeanZ"           
[55] "fBodyAccJerkStdDevX"         
[56] "fBodyAccJerkStdDevY"         
[57] "fBodyAccJerkStdDevZ"         
[58] "fBodyAccJerkMeanFreqX"       
[59] "fBodyAccJerkMeanFreqY"       
[60] "fBodyAccJerkMeanFreqZ"       
[61] "fBodyGyroMeanX"              
[62] "fBodyGyroMeanY"              
[63] "fBodyGyroMeanZ"              
[64] "fBodyGyroStdDevX"            
[65] "fBodyGyroStdDevY"            
[66] "fBodyGyroStdDevZ"            
[67] "fBodyGyroMeanFreqX"          
[68] "fBodyGyroMeanFreqY"          
[69] "fBodyGyroMeanFreqZ"          
[70] "fBodyAccMagMean"             
[71] "fBodyAccMagStdDev"           
[72] "fBodyAccMagMeanFreq"         
[73] "fBodyBodyAccJerkMagMean"     
[74] "fBodyBodyAccJerkMagStdDev"   
[75] "fBodyBodyAccJerkMagMeanFreq" 
[76] "fBodyBodyGyroMagMean"        
[77] "fBodyBodyGyroMagStdDev"      
[78] "fBodyBodyGyroMagMeanFreq"    
[79] "fBodyBodyGyroJerkMagMean"    
[80] "fBodyBodyGyroJerkMagStdDev"  
[81] "fBodyBodyGyroJerkMagMeanFreq"
```



