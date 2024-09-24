#summarize data
summary()

#
class()

#examine the structure of the object
str()

#$ aka column

#table can be from internet

#object[no.row,no.column]

#set up condition(== to be) to see which match the condition
students$gender=="female"

#create filter
filter<-students$gender=="female"

#make a filter into object
students[filter,]->female

#make s subset in a short way
female<-students[filter<-students$gender=='female',]

#change row or col names(c for combine)
rownames(females)<-c('Vanessa', 'Vicky', 'Michelle', 'Joyce', 'Victoria')

#:means every number between
1:nrow(female)

#sample 2 random object in 'female' in the filter 'sf'
sf<-sample(1:nrow(female), 2)

#create a vector with order
ind1<-order (students$height)

#sorting data set with  with filter
students [ind1,]

#shorten into
students[order(students$height),]

# If `condition` then give 'blue'. If not then gives 'red'.
colors<-ifelse(students$gender=='male', 'blue','red') 
#ifelse can be inside a ifelse

# create a new column
students$colors<-ifelse(students$gender=='male','blue','red') 

#delete column
data$column<-NULL

