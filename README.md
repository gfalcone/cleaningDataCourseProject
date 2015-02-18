# cleaningDataCourseProject


The repository is composed of three files : README.md, CodeBook.md and run_analysis.R

## How does the code work ?

1. We first check if the "UCI HAR Dataset" is in the same folder as the script is. 
2. We then read the two datasets ("X_test.txt" and "X_train.txt") and we merge them.
3. The next step is to select the columns with variable names containing "mean" and "std" and to associate the proper variable names on top of it. 
4. Then we get the activities and merge them to the dataset (from "y_test.txt" and "y_train.txt")
5. Almost there ! The script imports the subjects used for the observations (from "subject_test.txt" and "subject_train.txt") and adds them to the dataset
6. It then groups the dataset by subjects and activities, and calculates the mean for each column and finally saves the result in the working directory
