# Isai Lopez Garcia
# Programa para el dado de n caras

#Leyendo argumentos del script y asignando valor a n
args <- commandArgs(TRUE)
n <-as.numeric(args[1])

#Se le pone noombre al pdf
name <- paste0("Cube ",n," faces.pdf")
pdf(file = name)

#Generar 100 000 números aleatorios dentro del rango n
Face<-sample(1:n, 100000 , replace=TRUE)
table(Face)
hist(Face,seq(0, n, by = 1), col = "gray", main = paste("Histograma de un dado de", n, "caras lanzado 100,000 veces"), xlab = "Caras", ylab = "Frecuencia", freq = TRUE)
