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

# all of the dfs with test have 2947 rows, all of the dfs with train have 7352 rows
# therefore we can bind these dfs based on columns

full_test <- cbind(subject_test, y_test, X_test)
full_train <- cbind(subject_train, y_train, X_train)

#since full_test and full_train both have 563 columns, we can bind them by row
full_data <- rbind(full_test, full_train)

#Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

# 2.1: looking at the features document to see what each column represents

features <- read.table("UCI_HAR_Dataset/features.txt", as.is=TRUE)
head(features)
#we can see that in column 2 of the features table, some of the names have mean and some have std
#we will keep all elements that contain either mean or std, NO MATTER WHERE the word appears

# 2.2 : which column indices contain mean or std?
cmn<-grep("mean", features$V2)
csd<-grep("std", features$V2)

# 2.3: indexing the columns which need to be kept
#it is also important to keep the data about the subject and the activity, which are columns 1 and 2 of our 
# merged dataframe
# since the data in features was about the columns before the dataframes were merged, we add 2 to the vectors
# of indices to have the numbers of the columns to keep in our merged dataframe
keptcols <- c(1,2,cmn+2,csd+2)

#2.4: subsetting the table
q2data<- full_data[,keptcols]

#Step 3: Use descriptive activity names to name the activities in the data set

#The activities were indexed in the y_test and y_train tables, which are now in our second column
class(q2data[,2])
# Right now this column is numeric, but it should be a factor
q2data[,2]<- as.factor(q2data[,2])
# The activity labels can be obtained from the file activity_labels
activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt", as.is=TRUE)
activity_labels <- activity_labels[,2]
# Now we use these labels as levels of the factor
levels(q2data[,2])<-activity_labels

#Step 4: Appropriately label the data set with descriptive variable names.

# The first two columns of our data set should be called subject and activity
# for the rest of the columns, however, there are certain problems with the names
head(features)
#In order to make these names descriptive and respectful of good naming practices, we will:
#### make everything lower case to avoid typos
#### remove all special characters, replacing with "." if it makes sense to do so (parentheses are just removed)
#### replace all of the text which starts with "t" so that it starts with "time of"
#### replace all of the text which starts with "f" so that it starts with "frequency"
propernames<- features$V2[c(cmn, csd)]
propernames<- tolower(propernames)
propernames<-sub("^t","time.of.",propernames)
propernames<-sub("^f","freq.of.",propernames)
propernames<- gsub("-",".",propernames)
propernames <- gsub("\\()","",propernames)
propernames<- gsub("acc","acceleration",propernames)
allnames <- c("subject", "activity",propernames)
names(q2data)<-allnames
head(q2data[,1:5])

#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average
#       of each variable for each activity and each subject

#5.1 Grouping the data by activity and subject

library(dplyr)
q5data <- group_by(q2data,subject, activity)

#5.2 creating the new data set with only the average of each variable for each activity and each subject
q5smalltable<-summarize_each(q5data, mean)
write.table(q5smalltable, "tidy_output.txt")
