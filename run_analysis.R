##################################################################
# load required packages
library(dplyr)
library(tidyr)
##################################################################
# get the raw data 
##################################################################
id_test <- read.table("/Users/josi 1 2/Desktop/Modul3/Getting-and-Cleaning-Data-Course-Project/test/subject_test.txt", col.names = "id")
id_train <- read.table("/Users/josi 1 2/Desktop/Modul3/Getting-and-Cleaning-Data-Course-Project/train/subject_train.txt", col.names = "id")
y_test <- read.table("/Users/josi 1 2/Desktop/Modul3/Getting-and-Cleaning-Data-Course-Project/test/y_test.txt", col.names = "labels")
X_test <- read.table("/Users/josi 1 2/Desktop/Modul3/Getting-and-Cleaning-Data-Course-Project/test/X_test.txt")
y_train <- read.table("/Users/josi 1 2/Desktop/Modul3/Getting-and-Cleaning-Data-Course-Project/train/y_train.txt", col.names = "labels")
X_train <- read.table("/Users/josi 1 2/Desktop/Modul3/Getting-and-Cleaning-Data-Course-Project/train/X_train.txt")
# check out dim() and str()

# features are the names of the 561 columns
features <- read.table("features.txt")

# transpose the features into column names
column_names <- as.data.frame(t(features$V2))
rm(features) # remove what is no longer needed

# get column names and data tables together
colnames(X_test) <- column_names
colnames(X_train) <- column_names
rm(column_names) # remove what is no longer needed

##################################################################
# 4. labels the data set with descriptive variable names
##################################################################
# join the ids, the labels to the test and train data
testdata <- cbind(id_test, y_test, X_test)
traindata <- cbind(id_train, y_train, X_train)
# head(testdata[1:4])

##################################################################
# 1. Merge the training and the test sets to create one data set 
##################################################################
all_data <- bind_rows(testdata,traindata)
# convert into tbl class
tbl_df(all_data)
# head(all_data[1:4])
# 2974+7353

##################################################################
# 2. Extract mean and standard deviation for each measurement     
# 3. descriptive activity names
##################################################################
data <- all_data %>%
           select(id, labels, contains(c("mean","std"))) %>%
             mutate(activity = case_when(
               labels == 1 ~ "WALKING",
               labels == 2 ~ "WALKING_UPSTAIRS", 
               labels == 3 ~ "WALKING_DOWNSTAIRS",
               labels == 4 ~ "SITTING",
               labels == 5 ~ "STANDING",
               labels == 6 ~ "LAYING",
               TRUE ~ as.character(labels))) %>%
             relocate(activity, .before = "tBodyAcc-mean()-X") %>%
           select(-labels)
##################################################################
# 5. From the data set in step 4, creates a second, independent 
# tidy data set with the average of each variable for each activity
# and each subject.
##################################################################
tidy_data <- data %>%
              group_by(id, activity, .add=TRUE) %>%
              summarise(across(.fns = mean))

# save the final data as a text file 
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)

##################################################################

# prepare the data for the codebook
var <- names(tidy_data)
write.table(var, file = "variables.txt", row.name=FALSE, quote=FALSE)