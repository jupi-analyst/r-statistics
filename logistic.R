# 독립변수가 여러 가지 일 경우 확률 예측 위해 사용
# 분석하고 하는 대상들이 두 집단 또는 그 이상의 집단으로 나누어지는 경우, 개별 관측들이 어느 집단에 분류 되는지, 종속변수=범주형 [0,1]
# 비연속형 결좌범주 예측, 최대우도로 추정, 카이제곱 검증

dose <- c(1, 1, 2, 2, 3, 3) #복약종류
response <- c(0, 1, 0, 1, 0,1) #반응
count = c(7, 3, 5, 5, 2, 8) #복약 횟수
toxic <- data.frame(dose, response, count)
toxic

out = glm(response ~ dose, 
          weights = count, 
          family = binomial, 
          data = toxic)
summary(out)
plot(response ~ dose, data = toxic,
     type = 'n')
curve(predict(out, data.frame(dose = x),
              type = 'resp'),
      add = TRUE)
