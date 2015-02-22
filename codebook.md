# Codebook markdown for Coursera Getting and Cleaning data course project:

##Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove 
noise. Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth
filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

I chose to isolate only the variables who's description had "mean" or "std" separated from
the descriptor. The Features Selection document defined the "mean" and "std" of the 
measurements of each accelerometer and gyroscope and their axial signals as:  

mean(): Mean value
std(): Standard deviation

I felt it was necessary to capture all three axes "XYZ" of the mean and std measurements.
I did not change variable names from the Features Selection document in order to preserve 
the chain of data.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Furthermore, each measurement variable was reduced to an average of the participants
30 repititions of each activity per the course assignment.  


COL	VARIABLE					VALUE RANGE

###Individual participant ID's
1	ParticipantID				Numeric: 1-30

###Activity each participant performed	
2 	Activity					WALKING
								WALKING_UPSTAIRS
								WALKING_DOWNSTAIRS
								SITTING
								STANDING
								LAYING
								
##Researcher measured signals
###accelerometer and gyroscope 3-axial raw signals separated into body gravity and 
acceleration signals
3 	tBodyAcc-mean()-X			Min.   :0.2216   
								Max.   :0.3015  

4	tBodyAcc-mean()-Y			Min.   :-0.040514    
								Max.   :-0.001308  

5	tBodyAcc-mean()-Z			Min.   :-0.15251  
  								Max.   :-0.07538  

6 	tBodyAcc-std()-X			Min.   :-0.9961  
								Max.   : 0.6269  

7 	tBodyAcc-std()-Y			Min.   :-0.99024  
  								Max.   : 0.61694  

8 	tBodyAcc-std()-Z			Min.   :-0.9877  
  								Max.   : 0.6090  

9  	tGravityAcc-mean()-X		Min.   :-0.6800  
								Max.   : 0.9745  

10 	tGravityAcc-mean()-Y		Min.   :-0.47989  
								Max.   : 0.95659  

11 	tGravityAcc-mean()-Z		Min.   :-0.49509  
								Max.   : 0.95787  
								
12 	tGravityAcc-std()-X			Min.   :-0.9968  
								Max.   :-0.8296  

13 	tGravityAcc-std()-Y			Min.   :-0.9942  
								Max.   :-0.6436  

14 	tGravityAcc-std()-Z			Min.   :-0.9910  
								Max.   :-0.6102  

###Body linear acceleration and angular velocity
15 	tBodyAccJerk-mean()-X		Min.   :0.04269  
								Max.   :0.13019  
								
16 	tBodyAccJerk-mean()-Y		Min.   :-0.0386872  
								Max.   : 0.0568186  

17 	tBodyAccJerk-mean()-Z		Min.   :-0.067458  
								Max.   : 0.038053  

18 	tBodyAccJerk-std()-X		Min.   :-0.9946  
								Max.   : 0.5443  

19 	tBodyAccJerk-std()-Y		Min.   :-0.9895  
								Max.   : 0.3553  

20	tBodyAccJerk-std()-Z		Min.   :-0.99329  
								Max.   : 0.03102  

21 	tBodyGyro-mean()-X			Min.   :-0.20578  
								Max.   : 0.19270  

22 	tBodyGyro-mean()-Y			Min.   :-0.20421  
								Max.   : 0.02747  

23 	tBodyGyro-mean()-Z			Min.   :-0.07245  
								Max.   : 0.17910  

24 	tBodyGyro-std()-X			Min.   :-0.9943  
								Max.   : 0.2677  

25 	tBodyGyro-std()-Y			Min.   :-0.9942  
								Max.   : 0.4765  

26 	tBodyGyro-std()-Z			Min.   :-0.9855  
								Max.   : 0.5649  

27 	tBodyGyroJerk-mean()-X		Min.   :-0.15721  
								Max.   :-0.02209  

28 	tBodyGyroJerk-mean()-Y		Min.   :-0.07681  
								Max.   :-0.01320  

29 	tBodyGyroJerk-mean()-Z		Min.   :-0.092500  
								Max.   :-0.006941  

30 	tBodyGyroJerk-std()-X		Min.   :-0.9965  
								Max.   : 0.1791  
	
31 	tBodyGyroJerk-std()-Y		Min.   :-0.9971  
								Max.   : 0.2959  

32 	tBodyGyroJerk-std()-Z		Min.   :-0.9954  
								Max.   : 0.1932  

###Magnitude of three-dimensional signals calculated using the Euclidean norm
33 	tBodyAccMag-mean()			Min.   :-0.9865  
								Max.   : 0.6446  

34 	tBodyAccMag-std()			Min.   :-0.9865  
								Max.   : 0.4284  
								
35 	tGravityAccMag-mean()		Min.   :-0.9865  
								Max.   : 0.6446  

36 	tGravityAccMag-std()		Min.   :-0.9865  
								Max.   : 0.4284  

37 	tBodyAccJerkMag-mean()		Min.   :-0.9928  
								Max.   : 0.4345  

38 	tBodyAccJerkMag-std()		Min.   :-0.9946  
								Max.   : 0.4506  

39 	tBodyGyroMag-mean()			Min.   :-0.9807  
								Max.   : 0.4180  

40 	tBodyGyroMag-std()			Min.   :-0.9814  
								Max.   : 0.3000  

41 	tBodyGyroJerkMag-mean()		Min.   :-0.99732  
								Max.   : 0.08758  

42 	tBodyGyroJerkMag-std()		Min.   :-0.9977  
								Max.   : 0.2502  

###Fast Fourier Transform Products
43 	fBodyAcc-mean()-X			Min.   :-0.9952  
								Max.   : 0.5370  

44 	fBodyAcc-mean()-Y			Min.   :-0.98903  
								Max.   : 0.52419  

45 	fBodyAcc-mean()-Z			Min.   :-0.9895  
								Max.   : 0.2807  

46 	fBodyAcc-std()-X			Min.   :-0.9966  
								Max.   : 0.6585  

47 	fBodyAcc-std()-Y			Min.   :-0.99068  
								Max.   : 0.56019  

48 	fBodyAcc-std()-Z			Min.   :-0.9872  
								Max.   : 0.6871  

49 	fBodyAccJerk-mean()-X		Min.   :-0.9946  
								Max.   : 0.4743  

50 	fBodyAccJerk-mean()-Y		Min.   :-0.9894  
								Max.   : 0.2767  

51 	fBodyAccJerk-mean()-Z		Min.   :-0.9920  
								Max.   : 0.1578  

52 	fBodyAccJerk-std()-X		Min.   :-0.9951  
								Max.   : 0.4768  

53 	fBodyAccJerk-std()-Y		Min.   :-0.9905  
								Max.   : 0.3498  

54 	fBodyAccJerk-std()-Z		Min.   :-0.993108  
								Max.   :-0.006236  

55 	fBodyGyro-mean()-X			Min.   :-0.9931  
								Max.   : 0.4750  

56 	fBodyGyro-mean()-Y			Min.   :-0.9940  
								Max.   : 0.3288  

57 	fBodyGyro-mean()-Z			Min.   :-0.9860  
								Max.   : 0.4924  

58 	fBodyGyro-std()-X			Min.   :-0.9947  
								Max.   : 0.1966  
								
59 	fBodyGyro-std()-Y			Min.   :-0.9944  
								Max.   : 0.6462  

60 	fBodyGyro-std()-Z			Min.   :-0.9867  
								Max.   : 0.5225  

61 	fBodyAccMag-mean()			Min.   :-0.9868  
								Max.   : 0.5866  

62 	fBodyAccMag-std()			Min.   :-0.9876  
								Max.   : 0.1787  

63 	fBodyBodyAccJerkMag-mean()	Min.   :-0.9940  
								Max.   : 0.5384  

64 	fBodyBodyAccJerkMag-std()	Min.   :-0.9944  
								Max.   : 0.3163  

65 	fBodyBodyGyroMag-mean()		Min.   :-0.9865  
								Max.   : 0.2040  

66 	fBodyBodyGyroMag-std()		Min.   :-0.9815  
								Max.   : 0.2367  

67 	fBodyBodyGyroJerkMag-mean()	Min.   :-0.9976  
								Max.   : 0.1466  

68	fBodyBodyGyroJerkMag-std()	Min.   :-0.9976  
								Max.   : 0.2878  
