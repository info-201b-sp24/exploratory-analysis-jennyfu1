library(dplyr)
covid <- read.csv("/Users/yinyuchen/Desktop/info201/Covid_Data.csv")
num_table <- covid %>%
  mutate(SEX = factor(SEX, levels = c(1, 2), labels= c("female", "male"))) %>%
  filter(CLASIFFICATION_FINAL < 4) %>%
  group_by(SEX) %>%
  summarize(total_num = n()) 

tobacco_table <- covid %>%
  mutate(SEX = factor(SEX, levels = c(1, 2), labels= c("female", "male"))) %>%
  filter(CLASIFFICATION_FINAL < 4) %>%
  group_by(SEX) %>%
  filter(TOBACCO == 1) %>%
  summarize(num_use_tobacco = sum(TOBACCO)) 

hipertension_table <- covid %>%
  mutate(SEX = factor(SEX, levels = c(1, 2), labels = c("female", "male"))) %>%
  filter(CLASIFFICATION_FINAL < 4) %>%
  group_by(SEX) %>%
  filter(HIPERTENSION == 1) %>%
  summarize(num_hipertension = sum(HIPERTENSION))

died_table <- covid %>%
  mutate(SEX = factor(SEX, levels = c(1, 2), labels = c("female", "male"))) %>%
  filter(CLASIFFICATION_FINAL < 4) %>%
  group_by(SEX) %>%
  filter(DATE_DIED != as.Date(9999-99-99)) %>%
  summarize(num_died = n())

age_table <- covid %>%
  mutate(SEX = factor(SEX, levels = c(1, 2), labels = c("female", "male"))) %>%
  filter(CLASIFFICATION_FINAL < 4) %>%
  group_by(SEX) %>%
  summarize(max_age = max(AGE))

summary_table <- num_table %>%
  left_join(tobacco_table, by = "SEX") %>%
  left_join(hipertension_table, by = "SEX") %>%
  left_join(died_table, by = "SEX") %>%
  left_join(age_table, by = "SEX")

View(summary_table)
