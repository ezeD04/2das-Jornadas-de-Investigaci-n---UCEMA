# Parámetros
tamaño_muestra <- 28
casos_exitosos_observados <- 17
proporción_observada <- casos_exitosos_observados / tamaño_muestra
n_simulaciones <- 10000  # Número de simulaciones
#-------------------------------------------------------------------------
# Simulamos las proporciones bajo la hipótesis nula (50%)
set.seed(123)  # Para reproducibilidad
simulaciones <- rbinom(n_simulaciones, tamaño_muestra, 0.5)
proporciones_simuladas <- simulaciones / tamaño_muestra
# Calculamos la proporción de simulaciones que son iguales o mayores a la observada
p_valor_simulado <- mean(proporciones_simuladas >= proporción_observada)
p_valor_simulado
