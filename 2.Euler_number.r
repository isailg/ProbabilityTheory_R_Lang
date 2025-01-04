# Isai Lopez Garcia
# Programa para aproximar 1 Gb de digitos del numero e con Series de Taylor

#Leyendo argumentos del script y asignando valor a n
args <- commandArgs(TRUE)
n <-as.numeric(args[1])


require ("Rmpfr")

digitos <- n 
prec = digitos*log2(10)

e <- mpfr(0,prec)

iteraciones = 10000
for (i in 0:iteraciones) {
  e <- e + 1 / factorial(i)
}

e_char <- format(e, scientific = FALSE)

#divide toda la cadena en líneas de 100 dígitos
div <- 100

slides <- strsplit(e_char, "")[[1]]

lineas <- list()

for (i in seq(1, length(slides), by = div)) {
  linea <- paste(slides[i:min(i + div - 1, length(slides))], collapse = "")
  lineas <- append(lineas, linea)
}


fileNume <- file("numero_e.txt", "w")
for (linea in lineas) {
  writeLines(linea, fileNume)
}
close(fileNume)

message("Tamaño en bits del número e (",prec," digitos) en memoria:")
object.size(e)
