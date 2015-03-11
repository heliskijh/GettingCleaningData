# R script to bring together multiple separate data files into one tiy data set via
# the below requirements as defined in the assignemnt:
# #1 - Merges the training and the test sets to create one data set
# #2 - Extracts only the measurements on the mean and standard deviation for each measurement 
# #3 - Uses descriptive activity names to name the activities in the data set
# #4 - Appropriately labels the data set with descriptive variable names 
# #5 - Average each variable for each activity and subject
# #6 - Output separate independant tidy data set for grading


library(dplyr) #load dplyr library for calls to arrange and summarize_each

## function to retireve only mean and std dev measurements from features.txt
getheader <- function(datatable){ #function definition
  headMean <- header[grep("mean()", header[,2], fixed=TRUE),] #retrieves all measurements ending in "mean()"
  headStd <- header[grep("std()", header[,2], fixed=TRUE),]  #retrieves all measurements ending in "std()"
  headFull <- rbind(headMean, headStd) #binds mean and std tables together
  headFull <- arrange(headFull, V1) #reorganzies the bound data into the original sequence from features.txt
  return(headFull) #returns the resulting data frame
}

## loads X_test and X_train data frames into R
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x <- rbind(x_test, x_train) #bind data frames together by row and outputs to single data frame
rm(x_test, x_train) #remove data frames no longer needed

## loads y_test and y_train data frames into R
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y <- rbind(y_test, y_train) #bind data frames together by row and outputs to single data frame
rm(y_test, y_train) #remove data frame no longer needed

##loads sub_test and sub_train tables into R
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
sub <- rbind(sub_test, sub_train) #bind data frames together by row and outputs to single data frame
rm(sub_test, sub_train) #remove data frames no longer needed

##read header file features.txt into data frame
header <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
colnames(x) <- header[,"V2"] #retirieve all variable chrachter names & assign to appropriate data columns
colnames(y) <- c("Activity") #name y column
colnames(sub) <- c("ParticipantID") #name subject column 

##read in activity table and convert y data frame from numeric to character desc
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
yint <- y$Activity #get numeric activities for conversion to character
yconv <- activity[match(yint, activity[,1]),2] #McDevitt solution from discussion forum-change activity label numeric to character
y$Activity <- yconv # overwrite y data frame with labeled data frame
rm(activity, yconv, yint) #remove data frames no longer needed

##isolate only mean and std columns from x dataset
head <- getheader(header) #call function on "header" data frame
colgrab <- head$V1 #isolate variables and assign to independant data frame
x <- x[,colgrab] #remove unspecified variables from x data frame
x <- cbind(y,x) #add y data frame (activities) to variable data frame
x <- cbind(sub,x) #add subject numbers to variable data frame
rm(sub, head, y, header, colgrab) #remove data frames no longer needed

## avg each variable column based on PartID and Activity, output to independant tidy data set
outputData <- x %>% group_by(ParticipantID, Activity) %>% summarise_each(funs(mean))
rm(x)

## make variable names tidy data/R compliant, remove duplicated "body" in names
colnames(outputData) <- tolower(names(outputData)) # change all variable names to lower case
colnames(outputData) <- gsub("-", "", names(outputData)) # remove "-" from variable names
colnames(outputData) <- gsub(pattern = "bodybody", replacement = "body", names(outputData))

##output tidy dataset in .txt format
write.table(outputData, file= "CourseProjectOutput.txt", row.names=FALSE)

