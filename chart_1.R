library(dplyr)
Covid <- read.csv("/Users/jenny/Desktop/Covid Data.csv")
library(ggplot2)
data("Covid", package = "ggplot2")

Covid <- Covid %>% mutate(TOBACCO=recode(TOBACCO, `1`="Yes", `2`="No"))

chart1_1 <- Covid %>% 
  filter(CLASIFFICATION_FINAL<4) 
chart1_2 <- Covid %>% 
  filter(CLASIFFICATION_FINAL>3) 


ggplot(data=chart1_1,aes(x=TOBACCO))+
  geom_bar()+
  ylim(c(0,400000))+
  labs(title="The distribution of tobacco use", 
       subtitle="people with COVID")

ggplot(data=chart1_2,aes(x=TOBACCO))+
  geom_bar()+
  ylim(c(0,400000))+
  labs(title="The distribution of tobacco use", 
       subtitle="people with unclear determination of whether got COVID")
