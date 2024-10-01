library (dplyr)

summarised <- summarise(iris, Mean.Width = mean(Sepal.Width))
head(summarised)
# by column names/'::'specify which package and don't need to library
selection1 <- dplyr::select(iris, Sepal.Length, Sepal.Width, Petal.Length)
head(selection1) 

# by column range/':'all between/'4'show 4 lines
selection2 <- dplyr::select(iris, Sepal.Length:Petal.Length)
head(selection2, 4)

# by column range number
selection3 <- dplyr::select(iris,c(2:5))
head(selection3)

#delete column
selection4 <- dplyr::select(iris, -Sepal.Length, -Sepal.Width)
head(selection4)

# Select setosa species
filtered1 <- filter(iris, Species == "setosa" )
head(filtered1,3)

# Select versicolor species with Sepal width more than 3
filtered2 <- filter(iris, Species == "versicolor", Sepal.Width > 3)
tail(filtered2)

#To create a column “Greater.Half” which stores a logical vector (T/F)
mutated1 <- mutate(iris, Greater.Half = Sepal.Width > 0.5 * Sepal.Length)
tail(mutated1)

#summary the new column
table(mutated1$Greater.Half)

# Sepal Width by ascending order
arranged1 <- arrange(iris, Sepal.Width)
head(arranged1)

# Sepal Width by descending order
arranged2 <- arrange(iris, desc(Sepal.Width))
head(arranged2)

# Mean sepal width by Species
gp <- group_by(iris, Species)
gp.mean <- summarise(gp,Mean.Sepal = mean(Sepal.Width))
gp.mean

#%>% connect function endless 'pipe operator'
#To select the rows with conditions
iris %>% filter(Species == "setosa",Sepal.Width > 3.8)
iris  %>% group_by(Species) %>% summarise(Mean.Length = mean(Sepal.Length))


#tidyr
TW_corals<-read.table('Data/tw_corals.txt', header=T, sep='\t', dec='.') 
TW_corals

#make wide table to be long
TW_corals_long <- TW_corals %>% pivot_longer(Southern_TW:Northern_Is, names_to = "Region", values_to = "Richness")
#if don't know the start and end
# TW_corals_long <-TW_corals %>% pivot_longer(cols = everything(), names_to = "Region", values_to = "Richness") 
TW_corals_long 

#make long table to be wide
TW_corals_wide <- TW_corals_long %>% pivot_wider( names_from = Region, values_from = Richness) 
TW_corals_wide

#missing data
income<-read.table('Data/metoo.txt',header=T, sep="\t", dec=".", na.strings = "n/a")
income

#splitting column
income_long <- income %>% pivot_longer(cols = -state,names_to = c("gender","work"), names_sep = "_", values_to = "income")
income_long

#reversely
income_long %>% pivot_wider(names_from = c(gender,work), values_from = income, names_sep = ".")

# Let's first create a delimited table/'-1'means except for first column
income_long_var <- income %>%  pivot_longer(cols = -1, names_to = "var1", values_to = "income")
income_long_var

# Split var1 column into two columns
income_sep <- income_long_var %>%  separate(col = var1, sep = "_", into = c("gender", "work"))
income_sep

#split row
income_long_var %>% separate_rows(var1, sep = "_")
