# Code Book

## About the transformations 

We merged the train and test dataset, selected columns with "mean" and "std" in it and added variable names.
We then added the subjects and activities corresponding to each observation. We performed the mean on each column for each subject and each activity

## About the variables 

By convention the accelerometer's data is expressed in m/s²

For each axis (X,Y,Z), we have the following variables :
- tBodyAcc-mean : mean of the acceleration of the body
- tBodyAcc-std : standard deviation of the acceleration of the body
- tGravityAcc-mean : mean of the acceleration of gravity
- tGravityAcc-std : standard deviation of the acceleration of gravity
- tBodyAccJerk-mean : mean of the acceleration jerk of the body
- tBodyAccJerk-std : standard deviation of the acceleration jerk of the body
- tBodyGyro-mean : mean of the gyroscope acceleration for the body
- tBodyGyro-std : standard deviation of the gyroscope acceleration for the body
And so it follows....

We also have :
- subjects : number from 1 to 30 representing a person
- activities : value between LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS,WALKING_UPSTAIRS
