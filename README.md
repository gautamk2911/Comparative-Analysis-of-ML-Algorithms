# Comparative Analysis of Machine Learning Algorithms

This repository contains an R Markdown project analyzing the performance of four machine learning algorithms—**KNN**, **Decision Tree**, **SVM**, and **Naive Bayes**—on the **Sonar dataset**. The analysis evaluates the algorithms using metrics such as **accuracy** - to determine the best model for binary classification tasks.

## Highlights
- **Dataset**: Sonar dataset from the `mlbench` R package.
- **Objective**: Classify sonar signals as either "Rock" or "Metal."
- **Preprocessing**: 
  - Feature normalization to ensure equal scaling.
  - Train-test split (80% training, 20% testing).
- **Output**: Identification of the best-performing algorithm based on evaluation metrics.

## Project Structure
- **`R Markdown Report.Rmd`**: The main R Markdown file containing:
  - Data preprocessing steps.
  - Implementation of the algorithms.
  - Evaluation of their performance.
- **Generated Report**: The output document includes visualizations, results, and conclusions.

## Technologies Used
- **Language**: R
- **Packages**:
  - `class`: For K-Nearest Neighbors (KNN).
  - `rpart` and `rpart.plot`: For Decision Tree modeling and visualization.
  - `e1071`: For Support Vector Machines (SVM) and Naive Bayes.
  - `mlbench`: For loading and handling the Sonar dataset.

