
#library nnet
library (nnet)
census <- read.csv(file.choose(), head= TRUE, sep= ";")
head(census)

census <- census[census$AGE>=18 & census$AGE<=65,]
census <- census[census$INCOME>=10000 & census$INCOME<= 100000,]

multinomial_regression <- multinom(CLASA ~ INCOME + SEX+ AGE + EDUC + STAO +ACTP, data=census)
summary(multinomial_regression)
## odds ratios
exp(coef(multinomial_regression))

# predicted probabilities
pp <- fitted(multinomial_regression)
head(pp)

