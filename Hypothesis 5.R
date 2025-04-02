Hypothesis 5:

Personal healthcare spending is influenced by self-reported health condition.

Independent Variable: Health Condition (Q16)  
Dependent Variable: Personal Spending on Health Care (Q3)

```{r}
library(dplyr)

data <- read.csv("data/Cleaned_Group_Project_Survey.csv")

# Map health condition levels
health_mapping <- c("Very unhealthy" = 1,
                    "Unhealthy" = 2,
                    "Neutral" = 3,
                    "Healthy" = 4,
                    "Very healthy" = 5)

spending_mapping <- c("0% - 5%" = 2.5, 
                      "6% - 10%" = 8, 
                      "11% - 15%" = 13)

data$Q16_numeric <- as.numeric(sapply(data$Q16, function(x) health_mapping[x]))
data$Q3_numeric <- as.numeric(sapply(data$Q3, function(x) spending_mapping[x]))

data_cleaned <- data %>% filter(!is.na(Q3_numeric), !is.na(Q16_numeric))

model <- lm(Q3_numeric ~ Q16_numeric, data = data_cleaned)
summary(model)

plot(data_cleaned$Q16_numeric, data_cleaned$Q3_numeric, 
     main = "Health Condition vs Health Care Spending",
     xlab = "Health Condition (1 = Poor, 5 = Excellent)", 
     ylab = "Health Care Spending (%)", pch = 19)
abline(model, col = "red")
