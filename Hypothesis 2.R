Hypothesis 2:

Inflation drives private spending on healthcare up as purchasing power decreases.

Independent Variable: Purchasing Power (Q8)  
Dependent Variable: Personal Spending on Health Care (Q3)

```{r}
library(dplyr)

# Read data
data <- read.csv("data/Cleaned_Group_Project_Survey.csv")

# Map responses to numeric values
power_mapping <- c("Strong purchasing power" = 3,
                   "Neutral purchasing power" = 2,
                   "Weak purchasing power" = 1)

spending_mapping <- c("0% - 5%" = 2.5, 
                      "6% - 10%" = 8, 
                      "11% - 15%" = 13)

data$Q8_numeric <- as.numeric(sapply(data$Q8, function(x) power_mapping[x]))
data$Q3_numeric <- as.numeric(sapply(data$Q3, function(x) spending_mapping[x]))

data_cleaned <- data %>% filter(!is.na(Q3_numeric), !is.na(Q8_numeric))

model <- lm(Q3_numeric ~ Q8_numeric, data = data_cleaned)
summary(model)

plot(data_cleaned$Q8_numeric, data_cleaned$Q3_numeric, 
     main = "Purchasing Power vs Health Care Spending",
     xlab = "Purchasing Power (1 = Weak, 3 = Strong)",
     ylab = "Health Care Spending (%)", pch = 19)
abline(model, col = "red")
