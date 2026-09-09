library(readr)
library(dplyr)
library(ggplot2)

data <- read_csv("muestra_data_hog_22.csv")

head(data)
tail(data)
summary(data)
colnames(data)
colSums(is.na(data))

glimpse(data)

data <- rename(data, sexo_jefe = s_jefe)

data$sexo_jefe <- factor(data$sexo_jefe,
                         levels = c(1, 2),
                         labels = c("Hombre", "Mujer"))

data2 <- na.omit(data)
colSums(is.na(data2))

data3 <- select(data2, sexo_jefe, ing_cor, alimentos, tot_integ)
head(data3)

data3 <- filter(data3, sexo_jefe == "Hombre")

data3 <- mutate(data3, p_alimentos = alimentos / ing_cor)

data4 <- arrange(data3, p_alimentos)
head(data4)

data4 <- arrange(data4, desc(p_alimentos))
head(data4)

data4 <- group_by(data4, tot_integ)

promedios <- summarise(data4,
                       promedio_alimentos = mean(p_alimentos))

promedios

promedios2 <- data %>%
  na.omit() %>%
  select(sexo_jefe, ing_cor, alimentos, tot_integ) %>%
  filter(sexo_jefe == "Hombre") %>%
  mutate(p_alimentos = alimentos / ing_cor) %>%
  arrange(desc(p_alimentos)) %>%
  group_by(tot_integ) %>%
  summarise(promedio_alimentos = mean(p_alimentos))

promedios == promedios2

mean(data2$ing_cor)
median(data2$ing_cor)
sd(data2$ing_cor)
var(data2$ing_cor)

quantile(data2$ing_cor, .1)
quantile(data2$ing_cor, .5)

data2 %>%
  group_by(sexo_jefe) %>%
  summarise(decil1 = quantile(ing_cor, .1))

data2 %>%
  group_by(sexo_jefe) %>%
  summarise(
    des_est = sd(ing_cor),
    promedio = mean(ing_cor),
    int = mean(tot_integ)
  )

table(data2$sexo_jefe)
table(data2$sexo_jefe, data2$tot_integ)

prop.table(table(data2$sexo_jefe))
prop.table(table(data2$sexo_jefe, data2$tot_integ))

cor(data2$ing_cor, data2$alimentos)

plot(data2$ing_cor, data2$alimentos,
     main = "Ingreso vs Alimentos",
     xlab = "Ingreso",
     ylab = "Alimentos",
     col = "red")

modelo <- lm(data2$alimentos ~ data2$ing_cor)
summary(modelo)

abline(modelo, col = "blue", lwd = 2)

ggplot(data) +
  geom_bar(aes(x = sexo_jefe, fill = sexo_jefe)) +
  labs(
    title = "Distribucion por sexo",
    x = "Sexo",
    y = "Frecuencia",
    fill = "Sexo"
  )

ggplot(data, aes(x = factor(1), fill = sexo_jefe)) +
  geom_bar(position = "fill") +
  coord_polar(theta = "y")

ggplot(data2) +
  geom_histogram(aes(x = ing_cor),
                 col = "red",
                 fill = "blue") +
  labs(
    title = "Histograma ingreso",
    x = "Ingreso corriente",
    y = "Frecuencia"
  )

ggplot(data2) +
  geom_point(aes(x = ing_cor, y = alimentos),
             col = "lightblue") +
  labs(
    x = "Ingreso corriente",
    y = "Alimentos"
  )


#Ejercicios
colSums(is.na(data))

data2 <- na.omit(data)

mean(data2$ing_cor)

data2 <- data2 %>%
  mutate(nivel_ingreso = ntile(ing_cor, 3)) %>%
  mutate(nivel_ingreso = factor(
    nivel_ingreso,
    labels = c("Bajo", "Medio", "Alto")
  ))

data2 %>%
  group_by(nivel_ingreso) %>%
  summarise(sd_ing_cor = sd(ing_cor))

table(data2$nivel_ingreso)

prop.table(table(data2$nivel_ingreso))

data2 %>%
  group_by(percep_ing) %>%
  summarise(promedio_integrantes = mean(tot_integ))

data2 %>%
  group_by(sexo_jefe) %>%
  summarise(ingreso_medio = mean(ing_cor))

cor(data2$tot_integ, data2$ing_cor)

modelo2 <- lm(ing_cor ~ tot_integ, data = data2)

summary(modelo2)

sub1 <- data2 %>%
  filter(sexo_jefe == "Mujer",
         tot_integ >= 4)

sub1

umbral <- quantile(data2$ing_cor, 0.75)

sub2 <- data2 %>%
  filter(ing_cor >= umbral)

sub2 %>%
  group_by(nivel_ingreso) %>%
  summarise(promedio_salud = mean(salud))
