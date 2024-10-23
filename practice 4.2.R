rairuoho<- read.delim("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt"
                      ,header=T, sep="\t", dec=".", na.strings = "n/a")

rairuoho1<- rairuoho %>% pivot_longer(day3:day8, names_to = "day", values_to = "length")

grplot<- ggplot(data = rairuoho1, aes(x=day, y=length, color=treatment))+
  geom_boxplot()+ 
  theme_economist()+
  scale_colour_economist()+
  ggtitle("Growth Comparison", subtitle = "nutrient vs. water")+
  theme(legend.position= "right", 
        legend.title= element_text(size=15),
        legend.text = element_text(size=12),
        legend.box.background= element_rect(color="black", fill="white"),
        axis.title= element_text(size=15),
        axis.title.y = element_text(margin = margin(r = 15)),
        axis.title.x = element_text(margin = margin(t = 10)),
        plot.title = element_text(size=25, margin = margin(b = 5)),
        plot.subtitle = element_text(size=15, margin = margin(b = 20, r=255)))+
  facet_grid(~treatment)
grplot
ggsave(grplot,filename = "Growth Comparison.pdf",width=7.86, height=5.49, units="in")



