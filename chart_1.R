library(dplyr)
Covid <- read.csv("/Users/jenny/Desktop/Covid Data.csv")
library(ggplot2)


chart1_1 <- Covid %>% 
  filter(CLASIFFICATION_FINAL<4) %>% 
  filter(TOBACCO<3)
chart1_2 <- Covid %>% 
  filter(CLASIFFICATION_FINAL>3) %>%
  filter(TOBACCO<3)


ggplot(data=chart1_1,aes(x=factor(TOBACCO, levels = c(1, 2), labels = c("Yes", "No"))))+
  geom_bar()+
  ylim(c(0,400000))+
  labs(title="The distribution of tobacco use", 
       subtitle="people with COVID")

ggplot(data=chart1_2,aes(x=factor(TOBACCO, levels = c(1, 2), labels = c("Yes", "No"))))+
  geom_bar()+
  ylim(c(0,400000))+
  labs(title="The distribution of tobacco use", 
       subtitle="people with unclear determination of whether got COVID")
