#Set Working Directory to UCI HAR Dataset
dir()

#***********************************************************************************
#Load test data sets
#***********************************************************************************
y_test<-read.table("./test/y_test.txt")
X_test<-read.table("./test/X_test.txt")
subject_test<-read.table("./test/subject_test.txt")

body_acc_x_test<-read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test<-read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test<-read.table("./test/Inertial Signals/body_acc_z_test.txt")

total_acc_x_test<-read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test<-read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test<-read.table("./test/Inertial Signals/total_acc_z_test.txt")

body_gyro_x_test<-read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test<-read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test<-read.table("./test/Inertial Signals/body_gyro_z_test.txt")

#Check the values for Y_test
str(y_test);
unique(y_test);

str(X_test);

unique(subject_test)

all_test<-cbind(subject_test,y_test,X_test,
                body_acc_x_test,body_acc_y_test,body_acc_z_test,
                total_acc_x_test,total_acc_y_test,total_acc_z_test,
                body_gyro_x_test,body_gyro_y_test,body_gyro_z_test)

str(all_test)
#***********************************************************************************
#***********************************************************************************

#***********************************************************************************
#Load train data sets
#***********************************************************************************
y_train<-read.table("./train/y_train.txt")
X_train<-read.table("./train/X_train.txt")
subject_train<-read.table("./train/subject_train.txt")

body_acc_x_train<-read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train<-read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train<-read.table("./train/Inertial Signals/body_acc_z_train.txt")

total_acc_x_train<-read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train<-read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train<-read.table("./train/Inertial Signals/total_acc_z_train.txt")

body_gyro_x_train<-read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train<-read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train<-read.table("./train/Inertial Signals/body_gyro_z_train.txt")


all_train<-cbind(subject_train,y_train,X_train,
                body_acc_x_train,body_acc_y_train,body_acc_z_train,
                total_acc_x_train,total_acc_y_train,total_acc_z_train,
                body_gyro_x_train,body_gyro_y_train,body_gyro_z_train)

#***********************************************************************************
#***********************************************************************************


#Merge Both Train and Test datasets
all_data<-rbind(all_test,all_train)

str(all_data)

#Load the sqldf library
library(sqldf)

#View All the Columns
colnames(all_data)

#Rename Column V1 to Subject
colnames(all_data)[1]<-"Subject"
colnames(all_data)[2]<-"Activity_Name"

sqldf("select distinct Subject from all_data")
sqldf("select distinct Activity_Name from all_data")

class(all_data$Subject)
class(all_data$Activity_Name)
#Convert Subject to Factor
all_data$Subject<-as.factor(all_data$Subject)
#Convert Subject to Character
all_data$Activity_Name<-as.character(all_data$Activity_Name)

#Give descriptive activity names to name the activities in the data set
all_data[which(all_data$Activity_Name=='1'),2]<-'WALKING'
all_data[which(all_data$Activity_Name=='2'),2]<-'WALKING_UPSTAIRS'
all_data[which(all_data$Activity_Name=='3'),2]<-'WALKING_DOWNSTAIRS'
all_data[which(all_data$Activity_Name=='4'),2]<-'SITTING'
all_data[which(all_data$Activity_Name=='5'),2]<-'STANDING'
all_data[which(all_data$Activity_Name=='6'),2]<-'LAYING'


unique(all_data$Activity_Name)
692+127
colnames(all_data)
colnames(all_data)[564:691]
colnames(all_data)[820:947]
colnames(all_data)[948:(948+127)]
948+127

colnames(all_data)[1076:(1076+127)]
#rename column Names for X
j=1;
for (i in 3:563)
{
  colnames(all_data)[i]<-paste('X_',j,sep="")
  j=j+1;
}

#rename column Names for body_acc_x
j=1;
for (i in 564:691)
{
  
  colnames(all_data)[i]<-paste('body_acc_x_',j,sep="")
  j=j+1;
}

#rename column Names for body_acc_y
j=1;
for (i in 692:819)
{
  
  colnames(all_data)[i]<-paste('body_acc_y_',j,sep="")
  j=j+1;
}

#rename column Names for body_acc_z
j=1;
for (i in 820:947)
{
  
  colnames(all_data)[i]<-paste('body_acc_z_',j,sep="")
  j=j+1;
}

#rename column Names for total_acc_x
j=1;
for (i in 948:(948+127))
{
  
  colnames(all_data)[i]<-paste('total_acc_x_',j,sep="")
  j=j+1;
}

#rename column Names for total_acc_y
j=1;
for (i in 1076:(1076+127))
{
  
  colnames(all_data)[i]<-paste('total_acc_y_',j,sep="")
  j=j+1;
}

#rename column Names for total_acc_z
j=1;
for (i in 1204:(1204+127))
{
  
  colnames(all_data)[i]<-paste('total_acc_z_',j,sep="")
  j=j+1;
}

1588+127
colnames(all_data)[1588:(1588+127)]

#rename column Names for body_gyro_x
j=1;
for (i in 1332:(1332+127))
{
  
  colnames(all_data)[i]<-paste('body_gyro_x_',j,sep="")
  j=j+1;
}

#rename column Names for body_gyro_y
j=1;
for (i in 1460:(1460+127))
{
  
  colnames(all_data)[i]<-paste('body_gyro_y_',j,sep="")
  j=j+1;
}


#rename column Names for body_gyro_z
j=1;
for (i in 1588:(1588+127))
{
  
  colnames(all_data)[i]<-paste('body_gyro_z_',j,sep="")
  j=j+1;
}

colnames(all_data)

str(all_data)
#Separate data set with mean of all values
colMeans(all_data,3)

all_data_avg<-sqldf("select Subject,Activity_name,avg(X_1),avg(X_2),avg(X_3),avg(X_4),avg(X_5),avg(X_6),avg(X_7),avg(X_8)
      from all_data group by Subject,Activity_Name")

write.table(all_data_avg,"all_data_avg.txt",sep=",",row.name=FALSE)
