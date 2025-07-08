# 🧪 Diabetes Health Prediction Modeling and Analysis (STAT 515)

This project presents a comprehensive statistical and machine learning approach to predicting diabetes diagnosis using clinical data. Conducted as part of the STAT-515 course at George Mason University (Fall 2023), the study explores factors influencing diabetes risk through logistic regression, decision trees, clustering, and regression models.

---

## 📊 Project Overview

- **Course**: STAT-515 Statistical Learning  
- **University**: George Mason University  
- **Semester**: Fall 2023  
- **Team**: Puneeth Velivela, Hemanth Reddy Kurapati  
- **Instructor**: Prof. Dr. Isuru Dassanayake  
- **Dataset**: [Mendeley Diabetes Dataset (2020)](https://doi.org/10.17632/wj9rwkp9c2)

---

## 🎯 Research Goals

1. **Diabetes Classification**  
   - How do age, BMI, and biochemical markers influence diabetes diagnosis?
   - Compare Decision Tree vs Logistic Regression for classification accuracy.

2. **HbA1c Prediction**  
   - Can we predict HbA1c using Linear, Ridge, and Lasso regression?
   - What are the most influential predictors?

3. **Age vs BMI**  
   - Is there a significant correlation between age and BMI?

---

## 📁 Project Structure

diabetes-health-prediction/
├── data/
├── scripts/
├── results/
│ ├── plots/
│ ├── model_outputs/
├── docs/
├── README.md
└── LICENSE

---

## ⚙️ Methodologies Used

### 🔸 Data Preprocessing
- Removed missing values (`na.omit`)
- Converted categorical data (e.g., Gender, CLASS)
- Normalized numeric features (Age, Urea, Cr, HbA1c, etc.)

### 🔸 Exploratory Data Analysis
- Boxplots grouped by diabetes class (`N`, `P`, `Y`)
- Density plots to observe value distribution
- Correlation matrix to assess multicollinearity

### 🔸 Classification Models
- **Logistic Regression**: Full model vs stepwise selection
- **Decision Tree**:
  - Achieved **98.5% accuracy**
  - Unpruned tree outperformed the pruned version
  - Most influential features: `HbA1c`, `BMI`, `Age`

### 🔸 Regression for HbA1c Prediction
| Model             | MSE      |
|------------------|----------|
| Linear Regression| 4.06     |
| Ridge Regression | 4.28     |
| Lasso Regression | 4.31     |

- Linear Regression had the lowest Mean Squared Error.

### 🔸 Hypothesis Testing: Age vs BMI
- **Null Hypothesis (H₀)**: No relationship between Age and BMI  
- **Correlation Coefficient**: 0.37  
- Conclusion: Statistically significant moderate positive relationship

---

## 📈 Key Findings

- **Decision Tree** outperformed logistic regression for classification
- **HbA1c** is the most important feature for diagnosing diabetes
- Linear regression best predicted HbA1c levels
- Hierarchical clustering gave limited insights due to overlapping variables
- Positive correlation found between **Age** and **BMI**

---

## 🔬 Future Work

- Explore ensemble learning (e.g., Random Forest, XGBoost)
- Incorporate additional biomarkers or genetic data
- Improve visualization of clustering results
- Experiment with time-series or longitudinal datasets

---

## 📚 References

- [Dataset: Mendeley Diabetes Data (2020)](https://doi.org/10.17632/wj9rwkp9c2)
- Logistic Regression in R – [Medium Article](https://towardsdatascience.com/simply-explained-logistic-regression-with-example-in-r-b919acb1d6b3)
- [Multinomial Logistic Regression Tutorial (YouTube)](https://www.youtube.com/watch?v=S2rZp4L_nXo)

---

## 👤 Contributors

- Puneeth Velivela  
- Hemanth Reddy Kurapati  

---

## 📄 License

This project is shared under the MIT License.

