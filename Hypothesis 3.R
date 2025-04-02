
Hypothesis 3:

As government healthcare policies become less supportive, private healthcare spending increases.

Independent Variable: Government Healthcare Policies (Q12)  
Dependent Variable: Personal Spending on Health Care (Q3)

```{r}
library(dplyr)

data <- read.csv("data/Cleaned_Group_Project_Survey.csv")

policy_mapping <- c("Very supportive" = 5,
                    "Supportive" = 4,
                    "Neutral" = 3,
                    "Unsupportive" = 2,
                    "Very unsupportive" = 1)

spending_mapping <- c("0% - 5%" = 2.5, 
                      "6% - 10%" = 8, 
                      "11% - 15%" = 13)

data$Q12_numeric <- as.numeric(sapply(data$Q12, function(x) policy_mapping[x]))
data$Q3_numeric <- as.numeric(sapply(data$Q3, function(x) spending_mapping[x]))

data_cleaned <- data %>% filter(!is.na(Q3_numeric), !is.na(Q12_numeric))

model <- lm(Q3_numeric ~ Q12_numeric, data = data_cleaned)
summary(model)

plot(data_cleaned$Q12_numeric, data_cleaned$Q3_numeric, 
     main = "Perceived Government Policy vs Health Spending",
     xlab = "Policy Supportiveness (1 = Unsupportive, 5 = Supportive)",
     ylab = "Health Care Spending (%)", pch = 19)
abline(model, col = "red")
