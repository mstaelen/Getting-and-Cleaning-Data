#init
## load library
#library(data.table) 
# can not be use, the input datas doesn't well format for using  fread

library(reshape2)

start.analysies <- function(dataDir, saveMeanFile=NA) {

        ##constant
        ### index of the extracted features
        features.extracted.index <-c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 
                81,82, 83, 84, 85, 86, 121, 122, 123, 124, 125,126, 161, 162, 
                163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 
                254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350,
                424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 
                543)
        ### name of the features
        features.extracted.names <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", 
                                       "tBodyAcc-mean()-Z", "tBodyAcc-std()-X",
                                "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", 
                                "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", 
                                "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", 
                                "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", 
                                "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", 
                                "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", 
                                "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", 
                                "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", 
                                "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", 
                                "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", 
                                "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", 
                                "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", 
                                "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", 
                                "tBodyAccMag-mean()", "tBodyAccMag-std()", 
                                "tGravityAccMag-mean()", "tGravityAccMag-std()", 
                                "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()",
                                "tBodyGyroMag-mean()", "tBodyGyroMag-std()",
                                "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
                                "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y",
                                "fBodyAcc-mean()-Z", "fBodyAcc-std()-X",
                                "fBodyAcc-std()-Y", "fBodyAcc-std()-Z",
                                "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y",
                                "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X",
                                "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z",
                                "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y",
                                "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", 
                                "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", 
                                "fBodyAccMag-mean()", "fBodyAccMag-std()", 
                                "fBodyBodyAccJerkMag-mean()", 
                                "fBodyBodyAccJerkMag-std()", 
                                "fBodyBodyGyroMag-mean()",
                                "fBodyBodyGyroMag-std()", 
                                "fBodyBodyGyroJerkMag-mean()", 
                                "fBodyBodyGyroJerkMag-std()")
        
        activities.extracted.index <- c(1, 2, 3, 4, 5, 6)
        activities.extracted.names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                                        "SITTING", "STANDING", "LAYING")
        
        
        ##functions
        generatePath <- function(dir,name,fileType) {
                file <- paste(fileType,"_", name, ".txt", sep = "")
                realDir <- file.path(dir,name)
                file.path(realDir,file)
        }
        
        GetData <- function(dataDir,name){
                
                subjects.file <- generatePath(dataDir,name,"subject")
                features.file <- generatePath(dataDir,name,"X")        
                activities.file <- generatePath(dataDir,name,"Y")
                
                ##Read the features table.
                ### read features
                features.table <- read.table(features.file)[features.extracted.index]
                names(features.table) <- features.extracted.names
                
                ### read activities
                activities.table <- read.table(activities.file)
                names(activities.table) <- c("activity")
                
                ####set the labels to the activities index for facilitate the reader
                activities.table$activity <- factor(activities.table$activity, 
                                                    levels = activities.extracted.index, 
                                                    labels = activities.extracted.names)
                ### read subjects
                subjects.table <- read.table(subjects.file)
                names(subjects.table) <- c("subject")
                
                ### bind all items
                clean.data <- cbind(features.table
                                    ,activity = activities.table$activity
                                    ,subject = subjects.table$subject
                )
                # Return the clean data
                clean.data
        }
        
        
        
        #Get the clean data of test & train
        test <- GetData(dataDir, "test")
        train <- GetData(dataDir, "train")
     
        #bind the datas
        all.data <- rbind(test, train)
        
        # Reshape the data.
        # Set the clean data
        all.data.clean <- melt(all.data, id = c("subject", "activity"))
        
        # Set the clean data, and give the average data
        all.data.clean.average <-  dcast(all.data.clean, 
                               subject + activity ~ variable, mean)
       
        if(is.na(saveMeanFile))
        {
                all.data.clean.average
        }
        else
        {
                # Save the clean data.
                saveMeanFile.fullpath <- file.path(dataDir, saveMeanFile)
                cat("Saving clean data to:", saveMeanFile.fullpath)
                write.table(all.data.clean.average, saveMeanFile.fullpath, row.names = FALSE, 
                            quote = FALSE, append=FALSE )
         }
}
 

#dataDir ="~/Documents/DataScientist/Module 3 Getting and Cleaning Data/projet/UCI HAR Dataset"
#start.analysies(dataDir,"cleanData_mean.txt")
