# Isai Lopez Garcia
""" Programa que grafica un punto a la mitad de una línea que forman un vértice aleatorio de un triángulo y el punto de la iteración anterior. El punto inicial tiene una posicón aleatoria dentro o fuera del triangulo. Como resultado entrega se genera el Triángulo de Sierpinski """

#Leyendo argumentos del script y asignando valor a n
args <- commandArgs(TRUE)
n <-as.numeric(args[1])

#Graficando triángulo
x<-c(0,0.5,1,0)
y<-c(0,sqrt(3)/2,0,0)



startXPoint=runif(1)
startYPoint=runif(1)


xPoints = list()
yPoints = list()

side<-sample(1:3, n, replace= TRUE)

for (i  in 1:n) {
    
    if (side[i] == 1){
        midXSide = 0
        midYSide = 0
    }
    
    if (side[i]== 2){
        midXSide = 1
        midYSide = 0
    }
    
    if (side[i]== 3){
        midXSide = 0.5
        midYSide = sqrt(3)/2
    }

    startXPoint = min(startXPoint,midXSide) + abs(startXPoint - midXSide)/2
    startYPoint = min(startYPoint,midYSide) + abs(startYPoint - midYSide)/2
    
    xPoints <- c(xPoints,startXPoint)
    yPoints <- c(yPoints,startYPoint)

}


plot(xPoints,yPoints,xlim= c(0,1),ylim=c(0,1), pch = 16, cex = 0.5)
lines(x,y)

# Zoom
zoom_x <- c(0.5, 1)
zoom_y <- c(0, 0.5)

plot(xPoints, yPoints, xlim = zoom_x, ylim = zoom_y, pch = 16, cex = 0.5, col = "black",
     main = "Zoom en el subtriángulo derecho", xlab = "X", ylab = "Y")
