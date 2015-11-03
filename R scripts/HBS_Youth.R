
#reading file HBS_youth
HBS_Youth <- read.csv(file.choose(), head= TRUE)
head(HBS_Youth)
tail(HBS_Youth)

HBS_Youth$Income <- as.integer(HBS_Youth$Income)
HBS_Youth$Expenditure <- as.integer(HBS_Youth$Expenditure)
HBS_Youth$Age <- as.integer(HBS_Youth$Age)

#plot the density functions and compare them
plot(density (HBS_Youth$Income))
plot(density (HBS_Youth$Expenditure))
par(mfrow=c(1,2))

hist(HBS_Youth$Income)
hist(HBS_Youth$Expenditure)

par(mfrow=c(1,1)) 
plot(HBS_Youth$Income, HBS_Youth$Expenditure)

liniar_regression <- lm (Expenditure  ~  Income, data = HBS_Youth)
summary(liniar_regression)


par(mfrow=c(2,2)) 
plot(liniar_regression)


coefficients <- coef(liniar_regression)
coefficients

residuals <- resid(liniar_regression)
head(residuals)

#fitted/estimated/predicted values
estimated_Expenditure1 <- fitted(liniar_regression)
head(estimated_Expenditure1)
#or using predict function
estimated_Expenditure2 <- predict(liniar_regression, interval = "confidence")
head(estimated_Expenditure2)


anova(liniar_regression)

par(mfrow=c(1,2)) 
plot(HBS_Youth$Income, HBS_Youth$Expenditure)
plot(HBS_Youth$Income, estimated_Expenditure1)

#multiple linear regression
multiple_liniar_regression <- lm (HBS_Youth$Expenditure  ~  HBS_Youth$Income+ HBS_Youth$Age)
summary(multiple_liniar_regression)

predict_MLR <- predict(multiple_liniar_regression)
head(predict_MLR)

