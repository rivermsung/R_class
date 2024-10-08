x <- 4
typeof(x)
## [1] "double"

x <- 4L
typeof(x)
## [1] "integer" put L become integer

x <- c("bubul", "magpie", "spoonbill", "barbet")
typeof(x)
## [1] "character" use" " to make it character

##factor actually have numeric behind
##factor always in a order
##reorganize the factor order
factor(a, levels=c("U","F","M"))

##delete factor don't need
droplevels()

##change row names
rownames(iris_sel) = seq(length=nrow(iris_sel))

##NA:value should be available but is unknown
##NULL:value does not exist or that it’s not measurable

##remove NA value
mean(x, na.rm=T)

##R converts the element types to the highest common mode, in the order NULL < logical < integer < double < character

