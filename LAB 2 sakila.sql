-- 1. Debe utilizar las funciones integradas de SQL para obtener información relacionada con la duración de las películas:
-- 1.1 Determine las duraciones de película más cortas y más largas y asigne a los valores el nombre y .max_duration y min_duration
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;
-- 1.2. Expresa la duración media de la película en horas y minutos. No uses decimales.
SELECT ROUND(AVG(length) / 60) AS horas, ROUND(AVG(length) % 60) AS minutos 
FROM film;
-- Sugerencia: Busque funciones de piso y redondas.
-- 2. Necesita obtener información relacionada con las fechas de alquiler:
-- 2.1 Calcular el número de días que la empresa lleva operando.
-- Sugerencia: Para ello, utilice la tabla de alquiler y la función DATEDIFF() para restar la fecha más temprana de la columna rental_date de la fecha más reciente.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operaring
FROM rental;
-- 2.2 Recupere la información del alquiler y agregue dos columnas adicionales para mostrar el mes y el día de la semana del alquiler. Devuelve 20 filas de resultados.
SELECT rental_id,
	   rental_date,
       DATE_FORMAT(rental_date, '%M') AS month_rent,
       DATE_FORMAT(rental_date, '%W') AS day_rent
       FROM rental
       LIMIT 20;
-- 2.3 Bonificación: Recupere la información de alquiler y agregue una columna adicional llamada DAY_TYPE con valores 'fin de semana' o 'día laborable', según el día de la semana.
-- Sugerencia: use una expresión condicional.
-- 3. Debe asegurarse de que los clientes puedan acceder fácilmente a la información sobre la colección de películas. Para lograr esto, recupere los títulos de las
-- películas y su duración de alquiler. Si algún valor de duración de alquiler es NULL, reemplácelo por la cadena 'No disponible'. Ordena los resultados del título de la película en orden ascendente.
-- Tenga en cuenta que incluso si actualmente no hay valores nulos en la columna de duración del alquiler, la consulta debe escribirse para controlar estos casos en el futuro.
-- Sugerencia: Busque la función IFNULL().
SELECT title,
	   IFNULL(rental_duration, 'not available') AS rental_duration
       FROM film
       ORDER BY title ASC;
-- 4. 