Hypothesis 4:

Personal spending on healthcare increases with age.

Independent Variable: Age (Q14)  
Dependent Variable: Personal Spending on Health Care (Q3)

```{r}
library(dplyr)

data <- read.csv("data/Cleaned_Group_Project_Survey.csv")

# Map age group midpoints
age_mapping <- c("18-24" = 21,
                 "25-34" = 29.5,
                 "35-44" = 39.5,
                 "45-54" = 49.5,
                 "55+" = 60)

spending_mapping <- c("0% - 5%" = 2.5, 
                      "6% - 10%" = 8, 
                      "11% - 15%" = 13)

data$Q14_numeric <- as.numeric(sapply(data$Q14, function(x) age_mapping[x]))
data$Q3_numeric <- as.numeric(sapply(data$Q3, function(x) spending_mapping[x]))

data_cleaned <- data %>% filter(!is.na(Q3_numeric), !is.na(Q14_numeric))

model <- lm(Q3_numeric ~ Q14_numeric, data = data_cleaned)
summary(model)

plot(data_cleaned$Q14_numeric, data_cleaned$Q3_numeric, 
     main = "Age vs Health Care Spending",
     xlab = "Age", ylab = "Health Care Spending (%)", pch = 19)
abline(model, col = "red")
