int <- -0.5049 #intercepto
x <- 0.4196     #pendiente
mod <- 0.5    #modificacion contrafactual
set.seed(123)

#ERROR--------------------
u<- numeric(28) 
for (i in 1:28){
  err <- rnorm(1,mean=-0.01,sd=0.12) #genero el error con los datos del modelo
  u[i] <-err}
#u <-log1p(u)
datos$error <- u
#random--------------------
ruido <- 0.05*mean(datos$vozAcoun)
R<- numeric(28)
for (i in 1:28){
  err <- rnorm(1,mean=0,sd=ruido)
  R[i] <-err}
#modelo contrafactual--------------
datos$vozAcoun_m <- datos$vozAcoun + (datos$vozAcoun*mod)+R #crear v.explicativa alternativa
datos$conCor_alt <- int+x*datos$vozAcoun_m+datos$error #crear variable Y alternativa
#datos$conCor_alt[datos$año < 2009] <- datos$conCor[datos$año < 2009]
#PLOTEAR---------------------------
graficar<- function(){
  grid(plot(datos$año,datos$conCor,
            type = "l",
            col="black",xlab="años",ylab="Índice control de corrupción"
            ,main="Escenario Contrafáctico",ylim=c(-0.62,0.2)))
  lines(
    x=datos$año, y=datos$conCor_alt,col="red",type = "b")
  abline(
    h=mean(datos$conCor,),lty=4)
  abline(
    h=mean(datos$conCor_alt),col="darkred",lty=4) 
  legend("topleft",legend = "61% de exito sobre el cumplimiento de H1",
                y.intersp = 0.001,
                x.intersp = 6.5,col = "red")
}
graficar()


