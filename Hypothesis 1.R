Hypothesis 1:

Personal spending on health care increases as personal income rises.

Independent Variable: Personal Income (Q2)  
Dependent Variable: Personal Spending on Health Care (Q3)

```{r}
library(dplyr)

# Read the cleaned survey data
data <- read.csv("data/Cleaned_Group_Project_Survey.csv")

# Define mappings for income categories and spending levels
income_mapping <- c("Under $25,000" = 12500, 
                    "$25,000-$49,999" = 37500, 
                    "$50,000-$74,999" = 62500, 
                    "$75,000-$99,999" = 87500, 
                    "Over $100,000" = 125000)

spending_mapping <- c("0% - 5%" = 2.5, 
                      "6% - 10%" = 8, 
                      "11% - 15%" = 13)

# Convert categorical responses to numeric using median values
data$Q2_numeric <- as.numeric(sapply(data$Q2, function(x) income_mapping[x]))
data$Q3_numeric <- as.numeric(sapply(data$Q3, function(x) spending_mapping[x]))

# Filter out rows with missing values in dependent variable
data_cleaned <- data %>% filter(!is.na(Q3_numeric), !is.na(Q2_numeric))

# Fit a linear regression model
model <- lm(Q3_numeric ~ Q2_numeric, data = data_cleaned)
summary(model)

# Plot the regression result
plot(data_cleaned$Q2_numeric, data_cleaned$Q3_numeric, 
     main = "Income vs Health Care Spending",
     xlab = "Personal Income ($)", 
     ylab = "Health Care Spending (%)", 
     pch = 19)
abline(model, col = "red")
