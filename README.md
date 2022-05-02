# Cierre Modulo 5 "Lenguaje de consultas a una base de datos postgreSQL".

Habilidades a evaluar
- Elaborar un modelo de Entidad-Relación identificando entidades, identificadores y relaciones entre entidades para representar un problema.
- Elaborar un modelo relacional utilizando reglas de transformación y de normalización (3FN) de acuerdo a un modelo entidad relación para representar un problema.


Descripción

Se requiere modelar una base de datos para una biblioteca, de acuerdo a las reglas de negocio que ha definido el cliente. Debes prestar especial atención en la relación entre las entidades para crear el modelo conceptual, físico y lógico e implementar la base de datos de acuerdo a dicho modelamiento.

En detalle, se requiere modelar lo siguiente:
En la biblioteca se guardan los siguientes datos para cada préstamo que se realiza: los datos del libro (ISBN, título, número de páginas, código del autor, nombre y apellido del autor, fecha de nacimiento y muerte del autor, tipo de autor (principal, coautor)), datos del préstamo (fecha de inicio, fecha esperada de devolución y fecha real de devolución) y los datos del socio (rut, nombre, apellido, dirección y teléfono).

Además, se deben considerar las siguientes restricciones:

- Se registra una única dirección y teléfono para cada socio.
- El ISBN (International Standard Book Number), es un número de 13 cifras que identifica de una manera única a cada libro o producto de editorial publicado.
- Para este ejercicio, asumirá que la biblioteca posee un ejemplar de cada libro.
- El número único del autor es un correlativo interno que maneja la biblioteca para identificarlos y facilitar la búsqueda.
- Un libro tiene al menos un autor principal, puede tener además registrado un coautor.
- Un socio sólo puede pedir un libro a la vez.

Para realizar la carga de datos al modelo, se deben considerar los siguientes registros:

![image](https://user-images.githubusercontent.com/96355317/166333081-6113504b-b9d8-4e3a-b117-91aa30517238.png)
![image](https://user-images.githubusercontent.com/96355317/166333109-a78699a7-ce85-453c-be1f-e7643e520332.png)

Parte 1 - Creación del modelo conceptual, lógico y físico.

1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas. (1 Punto)
2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre ellas, los atributos, normalización y creación de tablas intermedias de ser necesario. (2 Puntos)
3. Realizar el modelo físico, considerando la especificación de tablas y columnas, además de las claves externas. (2 Puntos)

Parte 2 - Creando el modelo en la base de datos
1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. (2 puntos).
2. Se deben insertar los registros en las tablas correspondientes (1 punto).
3. Realizar las siguientes consultas:
- Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)
- Mostrar todos los autores que hayan nacido después del 01-01-1970. (0.5 puntos)
- ¿Cuál es el libro más solicitado? (0.5 puntos).
- Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días. (0.5 puntos)
