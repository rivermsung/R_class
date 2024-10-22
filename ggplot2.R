#ggplot2

ggiris <- ggplot(data=iris)
class(ggiris)

ggiris <- ggplot(data=iris)
ggiris2 <- ggiris+aes(x=Petal.Length,y=Petal.Width)
ggiris2$mapping

ggiris <- ggplot(data=iris)
ggiris2 <- ggiris+aes(x=Petal.Length,y=Petal.Width)
ggiris3 <- ggiris2+geom_point()

#combine
ggiris3 <- ggplot(data=iris,
                  mapping=aes(x=Petal.Length,y=Petal.Width))
ggiris3+geom_point()

ggiris_smooth<- ggiris3 + geom_smooth()
ggiris_smooth

ggiris_hist <- ggplot(data=iris, aes(x=Petal.Length))
ggiris_hist2 <- ggiris_hist + geom_histogram() 
ggiris_hist2

ggiris_box <- ggplot(data=iris, aes(x=Species,y=Petal.Length))
ggiris_box2 <- ggiris_box+geom_boxplot() 
ggiris_box2

pcPlot_violin <- ggiris_box+geom_violin() 
pcPlot_violin

ggiris_scatter2 <- ggplot(data=iris, 
                          aes(x=Petal.Length,y=Petal.Width,color=Species))
ggiris_scatter2 + geom_point()

ggiris_scatter4 <- ggplot(data=iris)
ggiris_scatter4 + geom_point(aes(x=Petal.Length,y=Petal.Width,color=Species, shape=Species))

patients_clean<-read.delim("C:/Users/dan91/Rstudio/data/patients_clean.txt")
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight, 
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(Smokes~Sex)

#wrap ignore the missing data but grid will show NA
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_wrap(~Pet+Smokes+Sex)

ggplot(patients_clean, aes(x=Sex, y=Weight)) + geom_boxplot()

#reorganize the order 
patients_clean$Sex <- factor(patients_clean$Sex, 
                             levels=c("Male","Female"))
ggplot(patients_clean,aes(x=Sex, y=Weight)) + geom_boxplot()

#scale_(x/y)_(continuous/discrete)
pcPlot + geom_point() + facet_grid(Smokes~Sex)+
  scale_x_continuous(name="height ('cm')",
                     limits = c(100,200),
                     breaks=c(125,150,175),
                     labels=c("small","justright","tall"))

pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Pet))
pcPlot + geom_point(size=4) + 
  scale_colour_brewer(palette = "Set2")

pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + scale_size_continuous(range = c(3,6),
                                              limits = c(25,40))

pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI,shape=Sex))
pcPlot + geom_point(size=4,alpha=0.8)+ 
  scale_shape_discrete(name="Gender") +
  scale_colour_gradient2(low = "Blue",mid="Black",high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")

pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Weight,y=Height))
pcPlot+geom_point()+stat_smooth()

pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Weight,y=Height))
pcPlot+geom_point()+stat_smooth(method="lm")

pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Weight,y=Height,colour=Sex))
pcPlot+geom_point()+stat_smooth(method="lm")

pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Weight,y=Height,colour=Sex))
pcPlot+geom_point()+stat_smooth(aes(x=Weight,y=Height),method="lm",
                                inherit.aes = F)

