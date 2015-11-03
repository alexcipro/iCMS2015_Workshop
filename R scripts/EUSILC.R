
#import data
EUSILC <- read.csv(file.choose(), head= TRUE, sep= ",")
head(EUSILC)

#run logit
mylogit <- glm(poverty ~ Income_EQ, data=EUSILC, family="binomial")
summary(mylogit)

## odds ratios
exp(coef(mylogit))

attach(EUSILC)

#Sigmoid for Income and fitted probabilities
estimated_probabilities <- fitted(mylogit)
head(estimated_probabilities)

plot(Income_EQ, estimated_probabilities, main = "Sigmoid")

#other way to estimate probabilities
p <- exp(9.645e+00-6.355e-04*Income_EQ)/(1+exp(9.645e+00-6.355e-04*Income_EQ))
head(p)

#multiple regression
mylogit2 <- glm(poverty ~ Income_EQ + Sex+ Age + Education, data=EUSILC, family = "binomial")

summary(mylogit2)
## odds ratios
exp(coef(mylogit2))

confint(mylogit2)

#predicted probabilities
probabilities <- fitted(mylogit2)
head(probabilities)

#relevel function
EUSILC$Income_EQ <- relevel (EUSILC$Sex, ref="2")