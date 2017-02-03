library(plyr)

# I manually downloaded the files and extracted them, but this can also be done in R 
# using the download.file() and unzip() functions

## Step 1: Merge the training and test sets into one data set

train.x <- read.table("UCI Har Dataset/train/X_train.txt")
train.y <- read.table("UCI Har Dataset/train/y_train.txt")
train.subject <- read.table("UCI Har Dataset/train/subject_train.txt")

test.x <- read.table("UCI Har Dataset/test/X_test.txt")
test.y <- read.table("UCI Har Dataset/test/y_test.txt")
test.subject <- read.table("UCI Har Dataset/test/subject_test.txt")

# combining the test and training data
# I am not combining all of the data yet because it makes step 2 a little easier
x.data <- rbind(train.x,test.x)
y.data <- rbind(train.y,test.y)
subject.data <- rbind(train.subject,test.subject)

## Step 2: extract measurements on the mean and standard deviation

features <- read.table("UCI Har Dataset/features.txt")
# this takes any field that has mean or std it its name
wanted.indices <- grep("*mean*|*std*",features[,2])

# subsets the data to only have the relevant columns
x.data = x.data[,wanted.indices]


## Step 3: give the activities descriptive names

activity = read.table("UCI Har Dataset/activity_labels.txt")
y.data[,1] = activity[y.data[,1],2]
names(y.data) = "activity"

## Step 4: label the data set with descriptive variable names

names(x.data) = features[wanted.indices,2]
names(subject.data) = "subject"

# finally combine all the data together
final.data = cbind(subject.data,y.data,x.data)

## Step 5: create new data set with averages for each subject+activity

new.data = ddply(final.data, .(subject,activity), function(x) colMeans(x[,3:81]))

write.table(new.data, "tidy_Data.txt", row.names = FALSE)
