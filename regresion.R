#REGRESION----------------
modelo <-lm(conCor ~ vozAcoun,data=datos)
summary(modelo)
summary(datos$conCor)
range(datos$conCor)
library(lmtest)
dwtest(modelo) #falló - inercia institucional
modelo2 <-lm(formula = conCor ~ vozAcoun + lag(conCor, 1.5), data = datos) #sumando inercia
summary(modelo2)
bptest(modelo)
shapiro.test(resid(modelo))
grid(plot(datos$vozAcoun,
          datos$conCor,
          main="Correlación Accountabilty vs Control de corrupción",
          xlab= "Nivel de accountability", 
          ylab="Nivel de control de corrupción",
          xlim=c(0.2,0.7),
          ylim=c(-0.7,0.2),
          pch=20))
legend("topright",legend = "Regresión",
       y.intersp = 0.01,
       x.intersp = 0.2,col = "red")
abline(modelo,col="red")
