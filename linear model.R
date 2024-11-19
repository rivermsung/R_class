library(gvlma)
library(Hmisc)
library(corrplot)
library(mvabund)
library(ggplot2)
Plant_height <- read.csv(file = "data/Plant_height.csv", header = TRUE)
mod1_plant<- lm(loght ~ temp, data = Plant_height)
mod1_plant$coefficients
plot(mod1_plant, which = 1)
gvmodel <- gvlma(mod1_plant)
summary(gvmodel)
mod3_plant<-lm(formula = loght ~ temp + rain, data = Plant_height)
BIC(mod1_plant); BIC(mod2_plant); BIC(mod3_plant)
turtles <- read.csv(file = "data/turtles.csv", header = TRUE)
str(turtles)
turtles$Temperature <- factor(turtles$Temperature)
boxplot(Days ~ Temperature, data = turtles, ylab = "Hatching time (days)", xlab = "Temperature (C)")


