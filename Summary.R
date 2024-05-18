library(dplyr)
covid <- read.csv("/Users/yinyuchen/Desktop/info201/Covid_Data.csv")
View(covid)

summary_info <- list()
summary_info$num_patients <- nrow(covid)
summary_info$num_features <- ncol(covid)
summary_info$max_age <- covid %>%
  filter(AGE == max(AGE, na.rm = TRUE)) %>%
  pull(AGE)
summary_info$num_tobacco <- covid %>%
  filter(TOBACCO == 1) %>%
  nrow()
summary_info$num_hypertension <- covid %>%
  filter(HIPERTENSION == 1) %>%
  nrow()
summary_info$elderly_patients <- covid %>%
  filter(AGE > 70) %>%
  nrow()
summary_info$num_died <- covid %>%
  filter(DATE_DIED != as.Date(9999-99-99)) %>%
  nrow()

summary_info