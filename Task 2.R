#TASK 2
#Prediction using unsupervised machine learning
# loading libaries
install.packages("cluster")
library(cluster)
library(ggplot2)
library(dplyr)
iris<-read.csv(file="C:\\Users\\Neeraj Garg\\Downloads\\Iris.csv")
str(iris)
head(iris)
ncol(iris)
# refining the datadset
data<-iris[,2:5]
head(data)
#normalizing the data
z<-scale(data)

#creating elbow chart
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(z, i)$withinss)

plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of Clusters',
     ylab = 'WCSS')

# creating clusters
set.seed(123)
kmeans<- kmeans(x = z, centers = 2)
y_kmeans<- kmeans$cluster

autoplot(kmeans,z,frame=TRUE)

kmeans$centers
