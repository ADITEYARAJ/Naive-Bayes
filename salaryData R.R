salary_train <- read.csv(file.choose())
salary_test <- read.csv(file.choose())
salary_train1 <- salary_train
salary_test1 <- salary_test
View(salary_train)
str(salary_train)
salary_train1$workclass <- as.numeric(salary_train$workclass)
salary_train1$education <- as.numeric(salary_train$education)
salary_train1$maritalstatus <- as.numeric(salary_train$maritalstatus)
salary_train1$occupation <- as.numeric(salary_train$occupation)
salary_train1$relationship <- as.numeric(salary_train$relationship)
salary_train1$race <- as.numeric(salary_train$race)
salary_train1$sex <- as.numeric(salary_train$sex)
salary_train1$native <- as.numeric(salary_train$native)
salary_train1$Salary <- as.numeric(salary_train$Salary)
View(salary_train1)
salary_test1$workclass <- as.numeric(salary_test$workclass)
salary_test1$education <- as.numeric(salary_test$education)
salary_test1$maritalstatus <- as.numeric(salary_test$maritalstatus)
salary_test1$occupation <- as.numeric(salary_test$occupation)
salary_test1$relationship <- as.numeric(salary_test$relationship)
salary_test1$race <- as.numeric(salary_test$race)
salary_test1$sex <- as.numeric(salary_test$sex)
salary_test1$native <- as.numeric(salary_test$native)
salary_test1$Salary <- as.numeric(salary_test$Salary)
View(salary_test1)
#creating naive based model
library(e1071)
model <- naiveBayes(salary_train$Salary~.,data = salary_train1[,-14],useKernal=T)
model
pr <- predict(model,salary_test1[,-14])
pr
mean(pr==salary_test[,14])#We get 79.32% accracy in our model prediction.
table(pr)
table(salary_test[,14])
prop.table(table(pr))

