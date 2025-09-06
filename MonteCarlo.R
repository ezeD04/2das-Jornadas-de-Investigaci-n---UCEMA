#coeficientes del interceto
int_std <- 0.1015 #desvío (std.Error)
int_me <- -0.5049 #estimado ~ promedio (Estimate)
#coeficientes del la variable x
x_std <- 0.2420 #desvío (std.Error)
x_me <- 0.4196 #estimado ~ promedio (Estimate)
set.seed(123)
#SIMULACION------------------------
n <- 10000 #cantidad de simulaciones
resultados_x <- numeric(n) #vector vacio para resultados
resultados_int <- numeric(n)
#MONTECARLO (PENDIENTE)-----------------------
 for (i in 1:n){ #inicia el bucle
   x_sim <-rnorm(1,mean=x_me,sd=x_std)
   efecto_sim_x<- x_sim
   resultados_x[i] <-efecto_sim_x
 }
#MONTECARLO (INTERCEPTO)------------------------
for (i in 1:n){ #inicia el bucle
  int_sim <-rnorm(1,mean=x_me,sd=x_std)
  efecto_sim_int<- int_sim
  resultados_int[i] <-efecto_sim_int
}

#-----------RESULTADOS----------
x_media <-mean(resultados_x)
int_media <-mean(resultados_int)
#GRAFICO HISTORGRAMA--------------
grafico_pendiente <-function(){
  hist(resultados_x,                #resultados pendiente
       col="lightblue",
       border = "white",
       xlab="pendientes", ylab="Frecuencia",
       main="Histograma simulación de pendiente")
  abline(v=0,col="black")
  abline(v=x_media,col="red")
  }
grafico_intercepto <-function(){
  hist(resultados_int,                #resultados intercepto
       col="lightblue",
       border = "white",
       xlab="interceptos", ylab="Frecuencia",
       main="Histograma simulación de intercepto")
  abline(v=0,col="black")
  abline(v=x_media,col="red")
}

