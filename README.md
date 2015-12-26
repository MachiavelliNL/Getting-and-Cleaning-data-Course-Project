# Getting-and-Cleaning-data-Course-Project 

In this course project a data set is aquired containing Human Activity Recognition Using Smartphones.
The datafiles aquired from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The files do include a README file whith more information about the data files

To run the script unzip the downloaded files and put the folder "UCI HAR Dataset" in your working directory. 
Open the file "run_analysis.R" and source the code  

Functional requirements of the code

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The dataset from step 4 has the following format

 $ subject_id       : int  : Indication of the subject. The dataset contains 30 different subjects with an id from 1 to 30
 $ activity_name    : chr  : Name of the activity for which the acceleration is measured
 $ feature_name     : chr  : Name of the feature which is measured
 $ feature_variable : chr  : The set of variables that were estimated from these signals
 $ feature_axial_dir: chr  : Axial direction of de measured acceleration
 $ acceleration     : num  : measurement of the acceleration

The dataset from step 5 has the following format
 $ subject_id       : int  : Indication of the subject. The dataset contains 30 different subjects with an id from 1 to 30
 $ activity_name    : chr  : Name of the activity for which the acceleration is measured
 $ feature_name     : chr  : Name of the feature which is measured
 $ feature_variable : chr  : The set of variables that were estimated from these signals
 $ feature_axial_dir: chr  : Axial direction of de measured acceleration
 $ average     		: num  : Average acceleration grouped by all columns in the dataset
 
 The datafile is ; seperated, includes the headers. and contains 11880 rows