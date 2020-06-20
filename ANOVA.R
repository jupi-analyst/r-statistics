install.packages("car")
library(car)
data(anorexia, package = "MASS") #거식증환자의 치료방법에 따른 몸무게의 변화가 있는가
#치료제, 이전, 이후 몸무게
leveneTest(Postwt ~ Treat, data = anorexia)
out1 = aov(Postwt ~ Treat, data = anorexia)
out1
summary(out1)

out2 = anova(lm(Postwt ~ Treat, data = anorexia))
out2
summary(out2)

out3 = oneway.test(Postwt ~ Treat, data = anorexia) #등분산성가정 var.equal = T
out3
