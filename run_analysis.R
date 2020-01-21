#run_analysis script

#Step 1: merge the training and test sets to create one data set

#1.1 Gathering the data from the different tables

subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
X_test <- read.table ("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
X_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")

#1.2 Looking at the dimensions of the dataframes to see how they merge

dim(subject_test)
dim(X_test)
dim(y_test)
dim(subject_train)
dim(X_train)
dim(y_train)

#1.3 Merging the dataframes together


full_test <- cbind(subject_test, y_test, X_test)
full_train <- cbind(subject_train, y_train, X_train)

full_data <- rbind(full_test, full_train)

#Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

# 2.1: looking at the features document to see what each column represents

features <- read.table("UCI_HAR_Dataset/features.txt", as.is=TRUE)
head(features)

# 2.2 : which column indices contain mean or std?
cmn<-grep("mean", features$V2)
csd<-grep("std", features$V2)

# 2.3: indexing the columns which need to be kept and subsetting the table

keptcols <- c(1,2,cmn+2,csd+2)

q2data<- full_data[,keptcols]

#Step 3: Use descriptive activity names to name the activities in the data set

q2data[,2]<- as.factor(q2data[,2])

activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt", as.is=TRUE)
activity_labels <- activity_labels[,2]

levels(q2data[,2])<-activity_labels

#Step 4: Appropriately label the data set with descriptive variable names.

propernames<- features$V2[c(cmn, csd)]
propernames<- tolower(propernames)
propernames<-sub("^t","time.of.",propernames)
propernames<-sub("^f","freq.of.",propernames)
propernames<- gsub("-",".",propernames)
propernames <- gsub("\\()","",propernames)
propernames<- gsub("acc","acceleration",propernames)
allnames <- c("subject", "activity",propernames)
names(q2data)<-allnames

#Step 5: From the data set in step 4, create a second, independent tidy data set with the average
#       of each variable for each activity and each subject

#5.1 Grouping the data by activity and subject

library(dplyr)
q5data <- group_by(q2data,subject, activity)

#5.2 creating the new data set with only the average of each variable for each activity and each subject
q5smalltable<-summarize_each(q5data, mean)
write.table(q5smalltable, "tidy_output.txt")
