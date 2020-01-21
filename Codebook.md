# Codebook

### General comments about the data
The data in this dataset is processed from original data collected in the "Human Activity Recognition Using Smartphones Dataset -Version 1.0" by Jorge L. Reyes-Ortiz et al. which is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

As stated by the authors of the original study:
*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz."*

This dataset presents a tidy summary of the mean observations of selected datapoints for each subject-activity pair (30 subjects times 6 activities = 180 observations).
The manipulations which have been made to the dataset, as well as the code which was used to make these manipulations are described in detail in the README.MD file in this repository.
### Columns in the dataset
The dataset contains 81 columns:

1: subject
The subject who was studied for this particular set of measurements.

2: activity
The activity that the subject was doing when the measurement was taken.

Columns 3-81 represent the mean of all the measurements which were taken for a particular type of observation for a subject_activity pair.

3: time.of.bodyacceleration.mean.x  
4: time.of.bodyacceleration.mean.y  
5: time.of.bodyacceleration.mean.z  
6: time.of.gravityacceleration.mean.x  
7: time.of.gravityacceleration.mean.y  
8: time.of.gravityacceleration.mean.z  
9: time.of.bodyaccelerationjerk.mean.x  
10: time.of.bodyaccelerationjerk.mean.y  
11: time.of.bodyaccelerationjerk.mean.z  
12: time.of.bodygyro.mean.x  
13: time.of.bodygyro.mean.y  
14: time.of.bodygyro.mean.z  
15: time.of.bodygyrojerk.mean.x  
16: time.of.bodygyrojerk.mean.y  
17: time.of.bodygyrojerk.mean.z  
18: time.of.bodyaccelerationmag.mean  
19: time.of.gravityaccelerationmag.mean  
20: time.of.bodyaccelerationjerkmag.mean  
21: time.of.bodygyromag.mean  
22: time.of.bodygyrojerkmag.mean  
23: freq.of.bodyacceleration.mean.x  
24: freq.of.bodyacceleration.mean.y  
25: freq.of.bodyacceleration.mean.z  
26: freq.of.bodyacceleration.meanfreq.x  
27: freq.of.bodyacceleration.meanfreq.y  
28: freq.of.bodyacceleration.meanfreq.z  
29: freq.of.bodyaccelerationjerk.mean.x  
30: freq.of.bodyaccelerationjerk.mean.y  
31: freq.of.bodyaccelerationjerk.mean.z  
32: freq.of.bodyaccelerationjerk.meanfreq.x  
33: freq.of.bodyaccelerationjerk.meanfreq.y  
34: freq.of.bodyaccelerationjerk.meanfreq.z  
35: freq.of.bodygyro.mean.x  
36: freq.of.bodygyro.mean.y  
37: freq.of.bodygyro.mean.z  
38: freq.of.bodygyro.meanfreq.x  
39: freq.of.bodygyro.meanfreq.y  
40: freq.of.bodygyro.meanfreq.z  
41: freq.of.bodyaccelerationmag.mean  
42: freq.of.bodyaccelerationmag.meanfreq  
43: freq.of.bodybodyaccelerationjerkmag.mean  
44: freq.of.bodybodyaccelerationjerkmag.meanfreq  
45: freq.of.bodybodygyromag.mean  
46: freq.of.bodybodygyromag.meanfreq  
47: freq.of.bodybodygyrojerkmag.mean  
48: freq.of.bodybodygyrojerkmag.meanfreq  
49: time.of.bodyacceleration.std.x  
50: time.of.bodyacceleration.std.y  
51: time.of.bodyacceleration.std.z  
52: time.of.gravityacceleration.std.x  
53: time.of.gravityacceleration.std.y  
54: time.of.gravityacceleration.std.z  
55: time.of.bodyaccelerationjerk.std.x  
56: time.of.bodyaccelerationjerk.std.y  
57: time.of.bodyaccelerationjerk.std.z  
58: time.of.bodygyro.std.x  
59: time.of.bodygyro.std.y  
60: time.of.bodygyro.std.z  
61: time.of.bodygyrojerk.std.x  
62: time.of.bodygyrojerk.std.y  
63: time.of.bodygyrojerk.std.z  
64: time.of.bodyaccelerationmag.std  
65: time.of.gravityaccelerationmag.std  
66: time.of.bodyaccelerationjerkmag.std  
67: time.of.bodygyromag.std  
68: time.of.bodygyrojerkmag.std  
69: freq.of.bodyacceleration.std.x  
70: freq.of.bodyacceleration.std.y  
71: freq.of.bodyacceleration.std.z  
72: freq.of.bodyaccelerationjerk.std.x  
73: freq.of.bodyaccelerationjerk.std.y  
74: freq.of.bodyaccelerationjerk.std.z  
75: freq.of.bodygyro.std.x  
76: freq.of.bodygyro.std.y  
77: freq.of.bodygyro.std.z  
78: freq.of.bodyaccelerationmag.std  
79: freq.of.bodybodyaccelerationjerkmag.std  
80: freq.of.bodybodygyromag.std  
81: freq.of.bodybodygyrojerkmag.std  
