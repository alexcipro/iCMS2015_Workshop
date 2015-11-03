# Enter the data
ENERGY <- read.csv(file.choose(), head= TRUE)
head(ENERGY)

# Summary statistics
summary(ENERGY$NRG)
summary(ENERGY$GDP)

# Plot histograms
par(mfrow=c(1,2)) 
hist(ENERGY$NRG)
hist(ENERGY$GDP)

#Plot NRG versus GDP
par(mfrow=c(1,1)) 
plot(ENERGY$GDP,ENERGY$NRG, xlab = "GDP (Million Euro)", ylab = "Energy consumption (thousand TOE)", main = "Correlation between energy consumption and GDP")

#Estimate the regression parameters
regression <- lm(NRG ~ GDP, data = ENERGY)
summary(regression)

#ANOVA
anova(regression)

#extracting coefficients and residuals
coef(regression)
resids <- residuals(regression)
head(resids)

#Confidence intervals
confint(regression, level = 0.95)

#Plot the residuals
plot(ENERGY$country, residuals(regression), ylab = "residuals", cex.axis =0.75, las=2)
abline(h=0,col="red")
text(25,40000,"Poland")

#plot regression
par(mfrow=c(2,2)) 
plot(regression)

#predictions with functions fitted or predict
estimated_NRG1 <- fitted (regression)
estimated_NRG2 <- predict(regression)

#plotting NRG and estimated NRG
par(mfrow=c(1,2))
plot(ENERGY$GDP, ENERGY$NRG)
plot(ENERGY$GDP, estimated_NRG)

#plotting estimated NRG for a target value of GDP

# plot Romanian case (observation: GDP=144282.2 and ENERGY=32346.0)
par(mfrow=c(1,1))
plot(ENERGY$GDP, estimated_NRG1)
abline(v=144282.2,col="blue")
abline(h=32346.0,col="blue")
#predict NRG value for GDP=500000
estimated_NRG3 <- predict(regression, newdata = data.frame(GDP=c(500000)),
                          interval = "confidence")

#plot estimated ENERGY
abline(v=500000,col="red")
abline(h=estimated_NRG3,col="red")
text(1300000, 60000, "estimated Energy when GDP=500000", font=10)

#predict NRG value for GDP=1500000
estimated_NRG4 <- predict(regression, newdata = data.frame(GDP=c(1500000)), 
                          interval = "confidence")
estimated_NRG4
abline(v=1500000,col="green")
abline(h=estimated_NRG4,col="green")


#predict NRG value for GDP=2500000
estimated_NRG5 <- predict(regression, newdata = data.frame(GDP=c(2500000)), 
                          interval = "confidence")
abline(v=2500000,col="violet")
abline(h=estimated_NRG5,col="violet")
