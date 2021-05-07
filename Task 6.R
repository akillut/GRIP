#Task 6
#Prediction using decison tree algorithm

data<-read.csv(file= "C:\\Users\\Neeraj Garg\\Downloads\\Iris.csv")
library(rpart)
library(caTools)
library(rpart.plot)
str(data)
head(data)

#spliting the dataset
split_values<-sample.split(data,0.70)
train<-subset(data,split_values==T);nrow(train)
test<-subset(data,split_values==F);nrow(test)
head(train)
#constructing a model
data<-iris[,2:6]
head(data)
model<-rpart(Species~SepalLengthCm+SepalWidthCm+PetalLengthCm+PetalWidthCm,train,method="class")
model<-rpart(Species~.,data=data,method="class")
plot(model)
text(model,pretty = -0.5)
rpart.plot(model)

result<-predict(model,test)


