# 🏥 Analyzing Factors Influencing Private Healthcare Spending

This project investigates how individual-level and macro-level factors influence personal healthcare spending in the U.S., based on a self-designed survey and hypothesis-driven regression analysis.

## 📌 Research Context

This study was motivated by the rising burden of healthcare on individuals, especially amid aging populations, inflation, and changing government policies. A Qualtrics survey was designed and distributed to collect data on income, health status, perceptions, and spending behavior.

## 🧪 Hypotheses & Methods

Each R script corresponds to one hypothesis. Categorical variables are mapped to numeric scales, and linear regression is used to evaluate relationships between predictors and personal healthcare spending.

| Script | Hypothesis | Independent Variable | Dependent Variable |
|--------|------------|----------------------|---------------------|
| `Hypothesis 1.R` | Spending ↑ as income ↑ | Q2 (Income) | Q3 (Spending) |
| `Hypothesis 2.R` | Spending ↑ as purchasing power ↓ | Q8 (Purchasing Power) | Q3 |
| `Hypothesis 3.R` | Spending ↑ as policy support ↓ | Q12 (Policy Supportiveness) | Q3 |
| `Hypothesis 4.R` | Spending ↑ with age | Q14 (Age) | Q3 |
| `Hypothesis 5.R` | Spending related to health condition | Q16 (Health Condition) | Q3 |

## 📂 File Overview

- `Hypothesis 1.R` – Income vs Health Spending  
- `Hypothesis 2.R` – Purchasing Power vs Health Spending  
- `Hypothesis 3.R` – Government Policy Support vs Health Spending  
- `Hypothesis 4.R` – Age vs Health Spending  
- `Hypothesis 5.R` – Health Condition vs Health Spending  
- `README.md` – Project overview and usage instructions

## 🔧 How to Run

1. Open each `.R` script in RStudio.
2. Make sure your survey data CSV file is placed in a `data/` folder (e.g., `data/Cleaned_Group_Project_Survey.csv`).
3. Run scripts cell by cell to review model summaries and visualizations.

Required R packages:
```r
install.packages(c("dplyr", "ggplot2"))
```

## 📈 Modeling Approach

- Category-to-median numeric mapping for regression compatibility
- Linear regression models
- Visual validation with scatter plots and fitted regression lines
- Significance interpreted via model summaries

## 📊 Results Summary

- Most hypotheses did **not** yield statistically significant results due to small and biased sample.
- Hypothesis 5 was statistically significant, but the direction was **opposite** to expectations (more spending among healthier individuals).
- Further research with larger, more representative data is needed.

---

This study reflects a data-driven approach to testing policy-relevant hypotheses using real-world survey data.
