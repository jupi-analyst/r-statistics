#근무년수가 연봉에 영향을 미치는가 ?
year = c(26, 16, 20, 7, 22,
         15, 29, 28, 17, 3, 1, 16, 19, 13, 27, 4, 30, 8, 3, 12)
annual_salary = c(1267, 887, 1022, 511,
                  1193, 795, 1713, 1477, 991, 455, 324, 944,
                  1232, 808, 1296, 486, 1516, 565, 299, 820) #십만원 단위

data = data.frame(year, annual_salary)
head(data)
summary(data)
plot(year, annual_salary)
cor(year, annual_salary)

ls = lm(annual_salary ~ year, data = data)
summary(ls)
plot(year, annual_salary)
