getwd()
install.packages("nnet")
library(nnet)
diabetes <- read.csv("ProjectAssignment/Dataset.csv")
summary(diabetes)
diabetes$CLASS <- trimws(diabetes$CLASS)
table(diabetes$CLASS)
str(diabetes)
diabetes$CLASS=as.factor(diabetes$CLASS)
install.packages("mlogit")
library(mlogit)
diabetes$out<-relevel(diabetes$CLASS,ref="Y")
mdata3<- mlogit.data(diabetes,varying=NULL,choice="Y",shape="wide")








model <- multinom(CLASS ~ AGE + BMI + Urea + Cr + HbA1c + Chol + TG + HDL + LDL + VLDL, data = diabetes, family = binomial)
summary(model)
predict(model,diabetes,type="prob")
# Assuming your data is in a data frame called 'data'
set.seed(42)
train_indices <- sample(1:nrow(diabetes), 0.8 * nrow(diabetes))
train_data <- diabetes[train_indices, ]
test_data <- diabetes[-train_indices, ]
model <- multinom(CLASS ~ AGE + Gender + BMI + Urea + Cr + HbA1c + Chol + TG + HDL + LDL + VLDL, data = train_data, family = binomial)
predictions <- predict(model, newdata = test_data)
# Assuming 'y' in test_data is the actual response variable
confusion_matrix <- table(test_data$CLASS, predictions)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Display results
print(paste("Accuracy:", round(accuracy, 2)))
print("Confusion Matrix:")
print(confusion_matrix)

library(leaps)
# Assuming 'data' is your dataset with 'CLASS' as the response variable
feature_subset <- regsubsets(CLASS ~ ., data = diabetes, method = "exhaustive")
names(which.max(summary(feature_subset)$adjr2))
# Extract the best subset of features
best_features <- names(which.max(summary(feature_subset)$adjr2))

# Fit multinomial logistic regression model
model1 <- multinom(CLASS ~ ., data = diabetes[, c("CLASS", best_features)])

library(car)  # for VIF
vif_values <- vif(model.matrix(~., data = diabetes))


# Example: Lasso regression for feature selection
library(glmnet)
# Select only numeric predictors
numeric_predictors <- diabetes[, sapply(diabetes, is.numeric)]
cv_lasso <- cv.glmnet(as.matrix(numeric_predictors), as.factor(diabetes$CLASS), family = "multinomial", alpha = 1,lambda = lambda_seq)
cv_lasso <- cv.glmnet(as.matrix(diabetes[, -which(colnames(diabetes) == "CLASS")]), as.factor(diabetes$CLASS), family = "multinomial", alpha = 1)
best_lambda <- cv_lasso$lambda.min
lasso_model <- glmnet(as.matrix(diabetes[, -which(colnames(diabetes) == "CLASS")]), as.factor(data$CLASS), family = "multinomial", alpha = 1, lambda = best_lambda)
library(glmnet)

# Assuming 'numeric_predictors' is your matrix of numeric predictors
lambda_seq <- exp(seq(-2, 2, length = 100))
plot(cv_lasso)
best_lambda <- cv_lasso$lambda.min
cv_lasso
summary(cv_lasso)
