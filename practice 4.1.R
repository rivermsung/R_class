color<-c("setosa"="black", "versicolor"="red", "virginica"="green")
shape<-c("setosa"=1, "versicolor"=2, "virginica"=3)

plot(iris[3:4], col= color[iris$Species], pch= shape[iris$Species], 
     xlab= "Petal length (cm)", ylab= "Petal width (cm)", 
     main= "Petal width vs. length")

legend("topleft",legend=c("setosa","versicolor","virginica"), 
       col=c("black","red","green"), pch=1:2:3)

abline(lm(Petal.Width~Petal.Length, data=iris), col="black")

text(5,0.5, 'R=0.96', col='black')

pdf(file = "Petal width vs. length.pdf", paper = "A4")
dev.off()
