# GettingCleaningData

Getting and Cleaning Data Course project repository

# Getting and Cleaning Data Course Project README

This script starts with the assumption that the Samsung data is available in the R working 
directory, in an unzipped UCI HAR Dataset folder. If the dataset is needed, it is
included in this repo as well as all of the original files for the project. The resulting
output file will be written into this directory.

## Project Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II)
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have
been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

## Datasets:
	- Inertial signals were used to generate original data
	- X,y,subject Test/Train -data combined and isolated for means and std deviation
	  calculations
	- features/activity_labels - used to label/identify the data contained in the above
	  sets as identification, within the tidy data output
	
## R script 
The R script is written to merge the datasets(X_test, X_train, y_test, y_train,
subject_test, subject_train) into one dataset(x).  From that dataset the script pulls 
the mean and standard deviation measurements as described and defined in codebook.md.
"DF" in the description refers to an R "data.frame".

The R script begins by loading the library(dplyr) and function(getheader), necessary for 
the operations used to "tidy" the files.  If "dplyr" package is not installed you should
install it before running this script.

	-Step 1- Load library dplyr
	
	-Step 2- Define getheader function:
			* Use grep to retrieve mean and std variable names from features.txt
			* Binds the resulting DF's into one DF - x
			* Organizes the DF by number to keep sequence with X,y,subject data
	
	-Step 3- Read in both X_test and X_train files to DF's
			* Row bind the two DF's together into one DF - y
			* Remove the two leftover DF's.
	
	-Step 4- Read in both y_test and y_train files to DF's
			* Row bind the two DF's together into one DF - sub
			* Remove the two leftover tables. 
			
	-Step 5- Read in both subject_test and subject_train files to DF's
			* Row bind the two DF's together into one DF
			* Remove the two leftover DF's.
			
	-Step 6- Assign column header names to DF's
			* Read in features.txt variables to DF then assign character variables, 
			  as header, to x dataset columns
			* Assign "Activity" as column header for y DF
			* Assign "ParticipantID" as column header for sub DF
		
	-Step 7- Replace activity numerics in y DF with verbal descriptors
			* Read in activity_labels to DF
			* Create int vector from y DF column
			* Use match to replace numeric y data with activity descriptor from file
			  activty_labels.txt
			* Overwrite original y data with character descriptors
		
	-Step 8- Isolate mean and standard deviation variables using getheader function
			* Isolate variables in head DF and assign to individual DF
			* Remove x DF columns "variables" not included in mean and standard deviation
			  definition
			* Add, through column bind, activity descriptors, "y" DF, to x DF
			* Add, through column bind, subject ID's, "sub" DF, to x DF
			* Remove un-neccesary DF's
	
	-Step 9- Average each variable column based on activity and participantID to produce
			 a "tidy" dataset
			* Group activities replecated by participant to get result in one avg for 
			  each activity	accomplished
			* Assign the result to it's own DF - outputData
			* remove leftover DF x
	
	-Step 10- Output the tidy DF to a .txt file in the users UCI HAR Dataset directory
			
## Naming
The y data represented numerics 1-6 for each activity the subject participated in.  These
are changed from numeric to character for the purposes of tidy data.  The character terms
were taken from the file "activity_labels.txt" where each number from that file 
corresponded to an activity.  These labels were then applied to the numeric y data.

The variable names for the individual measurements in the "features.txt" document were
applied, unchanged, to the x dataset.  It is my reasoning that leaving the names such as
as they were, (replications of terms ie BodyBody, or invalid R characters "-"), would
preserve the integrity of the data from researcher to tidy data form.  This also would
prevent any outside user from confusing the data/variables that were included in the
original data with variables in the tidy data set. For all I know, the variable names in 
the "features.txt" file is correct while the descriptor in the readme file is wrong.

## Retrieving the results
The output file "CourseProjectOutput.txt" can be read into R for examination with the
following code:
read.table("UCI HAR Dataset/CourseProjectOutput.txt", header=TRUE)




## Comments and Input
P.S.
To the graders.  If you have made it this far, I appreciate your effort and attention
to detail.  If it is not too much to ask, any comments/input on the streamlining or
improvment/modification of my R script, or the documentation that accompanies it would 
be greatly appreciated. I know I could have condensed some of my R script but I was 
concerned about not allowing checks in the data at different stages ie:

This:
  - x <- rbind(read.table("UCI HAR Dataset/test/X_test.txt"), read.table("UCI HAR Dataset/train/X_train.txt"))

Versus This:
  - x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  - x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  - x <- rbind(x_test, x_train)

I am quite new at this and am interested in improving my operating techniques. Thank you.
			
			
