##load packages
library(dplyr)
library(tidyr)
library(stringr)

## set work directory
setwd("UCI HAR Dataset")

##read the features file
features <- read.csv2("features.txt",header=F)
colnames(features) <- c("name")

##read the activity_label file
activity_labels <- read.csv("activity_labels.txt", header = F)
colnames(activity_labels) <- c("activity_name")
activity_labels <- mutate(activity_labels, id = str_sub(activity_name,1,1),activity_name = str_sub(activity_name,3))

## read the fact data sets
print("start reading test data")
x_test <- read.fwf("test/X_test.txt",widths = c(rep(16,561)),buffersize = 300)
print("start reading trainings data")
x_train <- read.fwf("train/X_train.txt",widths = c(rep(16,561)),buffersize = 300)
colnames(x_test) <- features$name
colnames(x_train) <- features$name

print("continuing processing")

##read the test dimensional data sets
subject_test <- read.csv("test/subject_test.txt", header = F)
colnames(subject_test) <- c("subject_id")
y_test <- read.csv("test/y_test.txt", header = F)
colnames(y_test) <- c("activity_id")


##read the training dimensional data sets
subject_train <- read.csv("train/subject_train.txt", header = F)
colnames(subject_train) <- c("subject_id")
y_train <- read.csv("train/y_train.txt", header = F)
colnames(y_train) <- c("activity_id")

##Combine all the datasets to 1 Dataframe (DF) for further processing
test_DF <- cbind.data.frame(subject_test,y_test,x_test)
train_DF <- cbind.data.frame(subject_train,y_train,x_train)
DF <- rbind.data.frame(test_DF,train_DF)


##process the dataset so it easy to tidy data to work with
DF <- DF %>%
  ##Transform the columns to rows and split all relevant variables
  gather(feature,acceleration,-activity_id,-subject_id) %>%
    separate(feature,into = c("feature_id","feature_name"),sep = " ") %>%
    separate(feature_name,into = c("feature_name","feature_variable","feature_axial_dir"),sep = "-") %>%
  
  ## filter the dataset to contain only mean and STD information
  filter(feature_variable == "mean()" | feature_variable == "std()")   %>%
  
  ## Add the activity labels and select all nessecary columns in the right order
  merge.data.frame(activity_labels,by.x = "activity_id", by.y = "id") %>%
    select(subject_id,activity_name,feature_name,feature_variable,feature_axial_dir,acceleration)


## create the summarized dataset
DF1 <- group_by(DF,activity_name,subject_id,feature_name,feature_variable,feature_axial_dir)
DF1 <- summarise(DF1,average = mean(acceleration))

## write the summarized dataset to file
write.table(DF1,"tidy_data.txt", row.name=FALSE, sep = ";" )  



