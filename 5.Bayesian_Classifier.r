# Isai Lopez Garcia
# Clasificador Bayesiano
# Para muestra de su funcionamiento se empleó como sistema recomendador de películas

# Datos de entrenamiento del clasificador
# Solo para la demostración del funcionamiento
data <- data.frame(
  Pelicula = c("P1", "P2", "P3", "P4", "P5"),
  Genero = c("Accion", "Comedia", "Accion", "Drama", "Accion"),
  Director = c("Spielberg", "Tarantino", "Spielberg", "Nolan", "Nolan"),
  Year = c(2015, 2020, 2018, 2021, 2019),
  Se_recomienda = c("Si", "No", "Si", "No", "Si")
)

# Nueva película para clasificar (Dato X) (Clasificación Y por predecir)
nueva_pelicula <- data.frame(
  Genero = "Drama",
  Director = "Spielberg",
  Year = 2019
)

# Aquí empieza el Clasificador Bayesiano

# Cálculo de probabilidades
prob_class <- prop.table(table(data$Se_recomienda))  # Probabilidades de clase

# Función para calcular probabilidades condicionales
calc_cond_prob <- function(data, feature, target, value, class) {
  subset <- data[data$Se_recomienda == class, ]
  prob <- sum(subset[[feature]] == value) / nrow(subset)
  return(prob)
}

# Cálculo de P(X|Y)
p_x_given_y <- calc_cond_prob(data, "Genero", "Se_recomienda", nueva_pelicula$Genero, "Si") *
  calc_cond_prob(data, "Director", "Se_recomienda", nueva_pelicula$Director, "Si") *
  calc_cond_prob(data, "Year", "Se_recomienda", nueva_pelicula$Year, "Si")

p_x_given_yn <- calc_cond_prob(data, "Genero", "Se_recomienda", nueva_pelicula$Genero, "No") *
  calc_cond_prob(data, "Director", "Se_recomienda", nueva_pelicula$Director, "No") *
  calc_cond_prob(data, "Year", "Se_recomienda", nueva_pelicula$Year, "No")

# Cálculo de probabilidades de clase
p_recomendar <- p_x_given_y * prob_class["Si"]
p_norecomendar <- p_x_given_yn * prob_class["No"]

# Clasificación
if (p_recomendar > p_norecomendar) {
  print("Se recomienda la película")
} else {
  print("No se recomienda la película")
}
