data(iris)
a <- iris
a$Species <- NULL # 꽃의 종에 대한 사전정보를 제거
a
kc <- kmeans(a, 3) # k = 3인 군집분석
summary(kc)
table(iris$Species, kc$cluster)
plot(a[c('Sepal.Length', 'Sepal.Width')], col = kc$cluster)
