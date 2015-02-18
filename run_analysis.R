main <- function() {
    
    library(dplyr) # This will be useful later on
    
    ## Checking if the dataset folder is in the same folder as the script
    
    files <- list.files()
    
    if(!("UCI HAR Dataset" %in% files)){
        stop("UCI HAR Dataset folder not in the same folder as script. Please make the modification and run this script again")
    }
    
    ## Let's read the two datasets, nrows and colClasses will improve the performance
    
    test <- read.table("UCI HAR Dataset/test/X_test.txt", nrows=2947, colClasses="numeric")
    train <- read.table("UCI HAR Dataset/train/X_train.txt", nrows=7352, colClasses="numeric")
    
    ## Let's merge the two datasets
    
    dataset <- rbind(train,test)
    
    ## Now we have to read the file containing the variable names and extract only the columns with mean and std in it
    
    variable_names <- read.table("UCI HAR Dataset/features.txt", nrows=561, colClasses=c("numeric","character"))
    
    variable_names <- variable_names[grep("std|mean[(]", variable_names$V2, value=FALSE),]
    
    dataset <- dataset[,variable_names$V1]
    names(dataset) <- variable_names$V2
    
    
    ## Now we have to get the related activities for each row
    
    activity <- c("WALKING","WALKING_UPSTAIRS","WALKING DOWNSTAIRS","SITTING","STANDING","LAYING")
    
    activities_train <- read.table("UCI HAR Dataset/train/y_train.txt", nrows=7352, colClasses="numeric")
    activities_train <- activity[activities_train$V1]
    
    activities_test <- read.table("UCI HAR Dataset/test/y_test.txt", nrows=2947, colClasses="numeric")
    activities_test <- activity[activities_test$V1]
    
    activities <- c(activities_train, activities_test)
    
    ## One last thing : we have to add the subjects used to perform the data collection
    
    subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", nrows=7352, colClasses="numeric")
    subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", nrows=2947, colClasses="numeric")
    
    subjects <- rbind(subjects_train,subjects_test)
    names(subjects) <- "subjects"
    
    ## Now we just have to include these columns to the dataset
    
    dataset <- cbind(subjects,activities,dataset)
    
    ## Now let's split the dataframe in order to calculate the average of each columns for each activity and subject
    
    dataset <- tbl_df(dataset)
    dataset <- group_by(dataset, subjects, activities)
    
    results <- summarise_each(dataset, funs(mean))
    
    write.table(results, file="results.txt", row.name=FALSE)

}