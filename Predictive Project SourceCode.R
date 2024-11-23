# Load required libraries
library(class)
library(rpart)
library(rpart.plot)
library(e1071)
library(mlbench)

# Load and preprocess Sonar dataset
data(Sonar)
sonar_data <- Sonar
sonar_data$Class <- factor(sonar_data$Class, levels = c("R", "M"))
normalized_data <- scale(sonar_data[, -61])  # Exclude Class column
normalized_data <- as.data.frame(normalized_data)
normalized_data$Class <- sonar_data$Class

# Data splitting
set.seed(123)
split <- sample(2, nrow(normalized_data), replace = TRUE, prob = c(0.8, 0.2))
train_data <- normalized_data[split == 1, ]
test_data <- normalized_data[split == 2, ]

# Model function to compute accuracy
model_accuracy <- function(model, train_data, test_data) {
  pred <- predict(model, test_data, type = "class")
  confusion_matrix <- table(test_data$Class, pred)
  accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
  return(accuracy)
}

# KNN
knn_predicted <- knn(train = train_data[, -61], test = test_data[, -61], 
                     cl = train_data$Class, k = 5)
knn_accuracy <- mean(knn_predicted == test_data$Class)

# Decision Tree
tree_model <- rpart(Class ~ ., data = train_data, method = "class")
rpart.plot(tree_model)
tree_accuracy  <- model_accuracy(tree_model, train_data, test_data)

# SVM
svm_model <- svm(Class ~ ., data = train_data, kernel = "linear")
svm_accuracy <- model_accuracy(svm_model, train_data, test_data)

# Naive Bayes
nb_model <- naiveBayes(Class ~ ., data = train_data)
nb_accuracy <- model_accuracy(nb_model, train_data, test_data)

# Print all accuracies
accuracies <- c(KNN = knn_accuracy, DecisionTree = tree_accuracy, SVM = svm_accuracy, NaiveBayes = nb_accuracy)
print(accuracies)

# Find and print the algorithm with the highest accuracy
best_algorithm <- names(accuracies)[which.max(accuracies)]
cat("The algorithm with the highest accuracy is:", best_algorithm, "with an accuracy of", round(max(accuracies), 4))

