#의사 결정 나무
install.packages("rpart")
library(rpart)
head(iris)

iris.df <- rpart(formula = Species ~ .,
                 data = iris,
                 method = 'class')
iris.df
plot(iris.df)
text(iris.df, use.n = T, cex = 0.7)
post(iris.df, file = "")

#시계열 분석
install.packages("WDI")
library(WDI)
gdp <- WDI(country = "KR",start = 1960, end = 2017)
names(gpd) <- 
kr <- gdp$PerCapGDP[gdp$Country == 'Korea, Rep.']
kr <- ts(kr, start = min(gdp$Year, end = max(gdp$year)))
install.packages("forecast")
library(forecast)
krts <- auto.arima(x = kr)
Forecasts = forecast(object = krBest, h = 5)
Forecasts
plot(Forecasts)