## CodeBook

### Data Source

One of the most exciting areas in all of data science right now is wearable computing - see for example http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For any information about the original data please refer to the "README.txt" available in the root folder.

### Tidy Dataset

Thew tidy dataset produced by the "run_analysis.R" script contains the average of each variable for each activity and each subject.
Only variables related to measurements on the mean and standard deviation are written in the tidy dataset.

This dataset comes with columns. The activity the subject and the 88 variables related to measurements on the mean and standard deviation

Here the complete list.

 [1] "activity"                          
 [2] "subject"                           
 [3] "tBodyAccMeanX"                     
 [4] "tBodyAccMeanY"                     
 [5] "tBodyAccMeanZ"                     
 [6] "tBodyAccStdX"                      
 [7] "tBodyAccStdY"                      
 [8] "tBodyAccStdZ"                      
 [9] "tGravityAccMeanX"                  
[10] "tGravityAccMeanY"                  
[11] "tGravityAccMeanZ"                  
[12] "tGravityAccStdX"                   
[13] "tGravityAccStdY"                   
[14] "tGravityAccStdZ"                   
[15] "tBodyAccJerkMeanX"                 
[16] "tBodyAccJerkMeanY"                 
[17] "tBodyAccJerkMeanZ"                 
[18] "tBodyAccJerkStdX"                  
[19] "tBodyAccJerkStdY"                  
[20] "tBodyAccJerkStdZ"                  
[21] "tBodyGyroMeanX"                    
[22] "tBodyGyroMeanY"                    
[23] "tBodyGyroMeanZ"                    
[24] "tBodyGyroStdX"                     
[25] "tBodyGyroStdY"                     
[26] "tBodyGyroStdZ"                     
[27] "tBodyGyroJerkMeanX"                
[28] "tBodyGyroJerkMeanY"                
[29] "tBodyGyroJerkMeanZ"                
[30] "tBodyGyroJerkStdX"                 
[31] "tBodyGyroJerkStdY"                 
[32] "tBodyGyroJerkStdZ"                 
[33] "tBodyAccMagMean"                   
[34] "tBodyAccMagStd"                    
[35] "tGravityAccMagMean"                
[36] "tGravityAccMagStd"                 
[37] "tBodyAccJerkMagMean"               
[38] "tBodyAccJerkMagStd"                
[39] "tBodyGyroMagMean"                  
[40] "tBodyGyroMagStd"                   
[41] "tBodyGyroJerkMagMean"              
[42] "tBodyGyroJerkMagStd"               
[43] "fBodyAccMeanX"                     
[44] "fBodyAccMeanY"                     
[45] "fBodyAccMeanZ"                     
[46] "fBodyAccStdX"                      
[47] "fBodyAccStdY"                      
[48] "fBodyAccStdZ"                      
[49] "fBodyAccMeanFreqX"                 
[50] "fBodyAccMeanFreqY"                 
[51] "fBodyAccMeanFreqZ"                 
[52] "fBodyAccJerkMeanX"                 
[53] "fBodyAccJerkMeanY"                 
[54] "fBodyAccJerkMeanZ"                 
[55] "fBodyAccJerkStdX"                  
[56] "fBodyAccJerkStdY"                  
[57] "fBodyAccJerkStdZ"                  
[58] "fBodyAccJerkMeanFreqX"             
[59] "fBodyAccJerkMeanFreqY"             
[60] "fBodyAccJerkMeanFreqZ"             
[61] "fBodyGyroMeanX"                    
[62] "fBodyGyroMeanY"                    
[63] "fBodyGyroMeanZ"                    
[64] "fBodyGyroStdX"                     
[65] "fBodyGyroStdY"                     
[66] "fBodyGyroStdZ"                     
[67] "fBodyGyroMeanFreqX"                
[68] "fBodyGyroMeanFreqY"                
[69] "fBodyGyroMeanFreqZ"                
[70] "fBodyAccMagMean"                   
[71] "fBodyAccMagStd"                    
[72] "fBodyAccMagMeanFreq"               
[73] "fBodyBodyAccJerkMagMean"           
[74] "fBodyBodyAccJerkMagStd"            
[75] "fBodyBodyAccJerkMagMeanFreq"       
[76] "fBodyBodyGyroMagMean"              
[77] "fBodyBodyGyroMagStd"               
[78] "fBodyBodyGyroMagMeanFreq"          
[79] "fBodyBodyGyroJerkMagMean"          
[80] "fBodyBodyGyroJerkMagStd"           
[81] "fBodyBodyGyroJerkMagMeanFreq"      
[82] "angletBodyAccMean,gravity"         
[83] "angletBodyAccJerkMean,gravityMean" 
[84] "angletBodyGyroMean,gravityMean"    
[85] "angletBodyGyroJerkMean,gravityMean"
[86] "angleX,gravityMean"                
[87] "angleY,gravityMean"                
[88] "angleZ,gravityMean"
