library(dplyr)
Covid <- read.csv("/Users/jenny/Desktop/Covid Data.csv")
library(ggplot2)



Covid$Covid_Status <- ifelse(Covid$CLASIFFICATION_FINAL %in% c(1, 2, 3), "Positive", "Inconclusive")


ggplot(data=Covid, aes(x=AGE, fill=Covid_Status))+
  geom_boxplot()+
  labs(title="The difference of age distribution of patients", 
       subtitle="By age", 
       x="age", 
       y="Covid status")