softies<-read.csv('data/sf_res.csv', sep=',', header=T)
str(softies)

softies$sample_no<-NULL
softies$species<-as.factor(softies$species)
softies$depth<-as.factor(softies$depth)
str(softies)

summary(softies)

plot1<-ggplot(iris, aes(x=Species, y=Sepal.Length))+geom_boxplot()
plot2<-ggplot(iris, aes(x=Species, y=Sepal.Width))+geom_boxplot()
plot3<-ggplot(iris, aes(x=Species, y=Petal.Length))+geom_boxplot()
plot4<-ggplot(iris, aes(x=Species, y=Petal.Width))+geom_boxplot()

grid.arrange(plot1, plot2,plot3, plot4, ncol=2)
describeBy (iris, iris$Species)

iris %>% group_by(Species) %>% summarise(across(c(1:4), length))
aggregate(iris[,1:4],by=list(iris$Species), median)
tapply(iris$Sepal.Length , iris$Species, mean)

fix(students)
