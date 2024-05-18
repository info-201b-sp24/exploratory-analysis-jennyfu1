covid_data <- read.csv("/Users/ivysun/Desktop/Covid Data.csv")
show(covid_data)
head(covid_data)
summary(covid_data)

colnames(covid_data)

covid_data$Covid_Status <- ifelse(covid_data$CLASIFFICATION_FINAL %in% c(1, 2, 3), "Positive", "Negative")
covid_data$HIPERTENSION<- ifelse(covid_data$HIPERTENSION == 1, "Yes", "No")
covid_data$HIPERTENSION <- as.factor(covid_data$HIPERTENSION)
hypertension_summary <- table(covid_data$HIPERTENSION, covid_data$Covid_Status)
print(hypertension_summary)

library(ggplot2)
ggplot(data=covid_data, aes(x=Covid_Status, fill=HIPERTENSION)) +
  geom_bar(position="fill") +
  labs(title="Proportion of Hypertension Among COVID-19 Positive and Negative Cases",
       x="COVID-19 Status", y="Proportion", fill="Hypertension") +
  scale_fill_manual(values=c("Yes"="red", "No"="blue")) +
  theme_minimal()
