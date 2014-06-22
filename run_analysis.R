#init
## load library
#library(data.table) 
# can not be use, the input datas doesn't well format for using  fread

library(reshape2)

start.analysies <- function(dataDir, saveMeanFile=NA) {

        ##constant
        ### index of the extracted features
        features.extracted.index <- c(34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50
                                      ,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68
                                      ,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86
                                      ,87,88,89,90,91,92,93,94,95,96,97,98,99)
        ### name of the features
        features.extracted.names <- c("mean(tBodyAcc-X)","mean(tBodyAcc-Y)"
                                      ,"mean(tBodyAcc-Z)","mean(tGravityAcc-X)","mean(tGravityAcc-Y)"
                                      ,"mean(tGravityAcc-Z)","mean(tBodyAccJerk-X)","mean(tBodyAccJerk-Y)"
                                      ,"mean(tBodyAccJerk-Z)",
                                      "mean(tBodyGyro-X)","mean(tBodyGyro-Y)","mean(tBodyGyro-Z)",
                                      "mean(tBodyGyroJerk-X)","mean(tBodyGyroJerk-Y)","mean(tBodyGyroJerk-Z)",
                                      "mean(tBodyAccMag)","mean(tGravityAccMag)","mean(tBodyAccJerkMag)",
                                      "mean(tBodyGyroMag)","mean(tBodyGyroJerkMag)","mean(fBodyAcc-X)",
                                      "mean(fBodyAcc-Y)","mean(fBodyAcc-Z)","mean(fBodyAccJerk-X)",
                                      "mean(fBodyAccJerk-Y)","mean(fBodyAccJerk-Z)","mean(fBodyGyro-X)",
                                      "mean(fBodyGyro-Y)","mean(fBodyGyro-Z)","mean(fBodyAccMag)",
                                      "mean(fBodyAccJerkMag)","mean(fBodyGyroMag)","mean(fBodyGyroJerkMag)",
                                      "std(tBodyAcc-X)","std(tBodyAcc-Y)","std(tBodyAcc-Z)","std(tGravityAcc-X)",
                                      "std(tGravityAcc-Y)","std(tGravityAcc-Z)","std(tBodyAccJerk-X)",
                                      "std(tBodyAccJerk-Y)","std(tBodyAccJerk-Z)","std(tBodyGyro-X)",
                                      "std(tBodyGyro-Y)","std(tBodyGyro-Z)","std(tBodyGyroJerk-X)",
                                      "std(tBodyGyroJerk-Y)","std(tBodyGyroJerk-Z)","std(tBodyAccMag)",
                                      "std(tGravityAccMag)","std(tBodyAccJerkMag)","std(tBodyGyroMag)",
                                      "std(tBodyGyroJerkMag)","std(fBodyAcc-X)","std(fBodyAcc-Y)",
                                      "std(fBodyAcc-Z)","std(fBodyAccJerk-X)","std(fBodyAccJerk-Y)",
                                      "std(fBodyAccJerk-Z)","std(fBodyGyro-X)","std(fBodyGyro-Y)",
                                      "std(fBodyGyro-Z)","std(fBodyAccMag)","std(fBodyAccJerkMag)",
                                      "std(fBodyGyroMag)","std(fBodyGyroJerkMag)")
        
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
