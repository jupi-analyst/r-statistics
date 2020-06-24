head(cars, 3)
a <- lm(dist ~ speed, cars) # 선형회귀
a
coef(a) #회귀계수
fitted(a)[1:4] #예측값
residuals(a)[1:4] #잔차
confint(a) #회귀계수 신뢰구간
deviance(a) #잔차 제곱합

predict(a, newdata = data.frame(speed=4))
coef(a)[1] + coef(a)[2]*4
predict(a, newdata = data.frame(speed=4),
        interval = 'confidence') #예측값의 신뢰구간

predict(a, newdata = data.frame(speed=4),
        interval = 'prediction') # 오차항을 고려함

summary(a) #회귀모형 평가
par(mfrow = c(2, 2)) #잔차의 등분산성검정
plot(a)

res <- residuals(a) # 잔차 추출
shapiro.test(res) # 샤피러윌크 정규성 검정

library(lmtest)
dwtest(a)

# 교차 유효성 검사(Cross Validation)
# 트레이닝 데이터를 학습시켜 테스트 데이터를 통해 검증 하는 것
# 과적합 방지(Overfitting)
library(party)
library(cvTools)
head(iris)
str(iris)

# K-Fold
cross <- cvFolds(nrow(iris), K = 3)
str(cross)
cross
cross$which # 균등분할 확인
cross$subsets # 랜덤하게 행번호 선정
k <- 1:3
acc = numeric()
cnt <- 1

for(i in k) {
  data_index <- cross$subsets[cross$which == i, 1]
}
train <- iris[-data_index, ]
test <- iris[data_index, ]
model <- ctree(formula = Species~., data = train)
pred <- predict(model, test)
t <- table(pred, test$Species)
t
acc[cnt] <- (t[1, 1] + t[2, 2] + t[3, 3])/ sum(t)
cnt <- cnt + 1
acc
mean(acc)
