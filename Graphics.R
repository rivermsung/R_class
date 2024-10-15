treatment <- c(0.02,1.8, 17.5, 55,75.7, 80)

plot(treatment)

#make it a line plot
plot(treatment, type = 'o')

#only line
plot(treatment, type="l")

#add a title with main argument and or a sub-title
plot(treatment, main="My Plot", sub="a plot")

#customize our x and y axis label with the `xlab` and `ylab` 
plot(treatment, xlab="Position", ylab="score")

#control the orientation of labels on axis using `las` argument
plot(treatment, las=1)
plot(treatment, las=2)

#control the size of points in our plot using the `cex` parameter
plot(treatment, cex=0.5)

#control the type of points in our plot using the `pch` parameter
plot(treatment, pch=8)

#line we control size with `lwd` parameter
plot(treatment, type="l",lwd=100)

#control the type of line with `lty` parameter
plot(treatment, type="l",lty=1)

#control color or lines or points using the `col` argument
plot(treatment, type="l", col="red")
plot(treatment, type="l", col="dodgerblue")

#specify `rgb` color and use define `alpha` to set transparency
myRed <- rgb(1,0,0, alpha=0.5)
plot(treatment, type="p", cex=4, pch=20, col=myRed)

#`par` set or query graphical parameters. Among other uses (size of plot margins `mar`, spacing between margin elements `mgp`, dimensions of whole plot `fig`, etc.), you modify `par` to plot two graphs next to each others
par(mfrow = c(1, 2))
plot(treatment, type="p", cex=4, pch=20, col=myRed)
plot(treatment, type="p", cex=4, pch=20, col='#87736f')

#reset the parameter
dev.off()

control <- c(0, 20, 40, 60, 80,100)
plot(control,treatment)

#`line`for create another line in the same plot
plot(treatment, type="o", col="blue")
lines(control, type="o", pch=22, lty=2, col="red")

#define the limit by `xlim`and `ylim` 
plot(treatment, type="o", col="blue",ylim=c(0,100))
lines(control, type="o", pch=22, lty=2, col="red")

#change limit automatically by `range`
g_range <- range(0, treatment, control)
g_range
plot(treatment, type="o", col="blue", ylim=g_range)

#turn off axis and annotation plotting using `axes=FALSE` and `ann=FALSE`
plot(treatment, type="o", col="blue", ylim=g_range, axes=FALSE, ann=FALSE)

#create our own X axis by using the `axis()` function. We specify the `side` argument for where to place axis, the `at` argument to specify where to put axis ticks and `lab` argument to specify labels for axis ticks
plot(treatment, type="o", col="blue", ylim=g_range, axes=FALSE, ann=FALSE)
axis(side=1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))

#use `seq()` function to make axis tick positions for `at` argument
plot(treatment, type="o", col="blue", ylim=g_range, axes=FALSE, ann=FALSE)
axis(side=1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=seq(0,g_range[2],by=20))

#add a box around our plot using the `box()` function.
box()

#add legend `legend()`
plot(treatment, type="o", col="blue", lwd=1, ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()
lines(control, type="o", pch=22, lty=2, col="red", lwd=2.5)
legend("topleft",legend=c("treatment","control"),col=c("blue","red"), pch=21:22, lty=1:2, lwd=c(1,2.5))

#for color blind
install.packages('viridis')
library(viridis)
viridis(5)

#Histogram
hist(treatment)
hist(treatment, col="lightblue", ylim=c(0,5),cex.main=0.8)

par(mfrow = c(1, 2))
hist(treatment, col="lightblue", ylim=c(0,5), cex.main=0.8, breaks = 2)
hist(treatment, col="lightblue", ylim=c(0,5), cex.main=0.8, breaks = 10)

#Dot charts help compare paired data
data<-data.frame(treatment, control)
row.names(data)<-c("Mon","Tue","Wed","Thu","Fri","Sat")
dotchart(as.matrix(t(data)))
dotchart(as.matrix(t(data)), color=c("red","blue"),main="Dotchart", cex=0.5)

#Boxplot
boxplot(len ~ dose, data = ToothGrowth,
        boxwex = 0.25, at = 1:3 - 0.2,
        horizontal=T, las= 1,
        subset = supp == "VC", col = "yellow",
        main = "Guinea Pigs' Tooth Growth",
        xlab = "tooth length",
        ylab = "Vitamin C dose mg",
        xlim = c(0.5, 3.5), ylim = c(0, 35), yaxs='i')

#text
plot(control, treatment, ylim = g_range)
text(20,60, 'THIS AREA OF \n THE PLOT HAS \n NO SAMPLE', col='red')
text(control, treatment, letters[1:6], adj=c(0,-1), col='blue')
