#RandomForest
install.packages('randomForest')
library(randomForest)
head(iris)
str(iris)
idx <- sample(2, nrow(iris), replace = T, prob = c(0.7, 0.3))
idx
train_data <- iris[idx == 1,]
test_data <- iris[idx == 2,]
head(train_data)

model <- randomForest(Species ~ ., data = train_data, ntree = 100, proximity = T)
model
table(train_data$Species, predict(model))
importance(model)
