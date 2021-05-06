
TASK #1

# Prediction using supervised learning

#loading the data
install.packages(readr)
url="https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv"
data<-read.csv(url)
nrow(data)
data<-as.data.frame(data)
class(data)
#loading library

library(rpart)
?rpart

library(dplyr)

library(caTools)
head(data)

#creating train and test sets
plot(data)

split_values<-sample.split(data$Scores,SplitRatio =0.70) 

train_sample<-subset(data,split_values==T)
nrow(train_sample)
test_sample<-subset(data,split_values==F)
nrow(test_sample)
# creating the apppropriate linear model
plot(data)
model<-lm(Scores~Hours,data=train_sample)
# the model formed Y = 1.712 + 9.898X
result<-predict(model,test_sample)
?predict
final<-cbind(Scores=test_sample$Scores,result)
class(final)
final<-as.data.frame(final)
error<-final$Scores-final$result
mse<-sqrt(mean(error^2))
mse

task<-as.data.frame(9.25)
colnames(task)<-"Hours"
predict(model,task)







