2.
	create database biblioteca;
	\c biblioteca;

	create table comunas (
	id serial primary key,
	comuna varchar(30)
	);

	create table socios (
	id serial primary key,
	rut varchar(12),
	nombre varchar(30),
	telefono INT,
	direccion varchar(20),
	id_comunas INT,
	foreign key(id_comunas) references comunas(id)
	);


	create table autores (
	id serial primary key,
	codigo INT,
	nombre varchar(20),
	apellido varchar(20),
	nacimiento INT,
	muerte INT
	);

	create table libros (
	id serial primary key,
	isbn varchar(15),
	titulo varchar(50),
	paginas INT,
	dias_prestamo INT,
	stock INT CHECK (stock >= 0.00)
	);

	create table libros_autores (
	id serial primary key,
	tipo_autor varchar(10),
	id_libros INT,
	id_autores INT,
	foreign key(id_libros) references libros(id),
	foreign key(id_autores) references autores(id)
	);


	create table historial_prestamos (
	id serial primary key,
	fecha_prestamo DATE,
	fecha_devolucion DATE,
	id_socios INT,
	id_libros INT,
	foreign key(id_socios) references socios(id),
	foreign key(id_libros) references libros(id)
	);

	insert into comunas (comuna) values ('Santiago');

	insert into socios (rut, nombre, telefono, direccion, id_comunas) values
	('1111111-1', 'Juan Soto', 911111111, 'Avenida 1', 1),
	('2222222-2', 'Ana Perez', 922222222, 'Pasaje 2', 1),
	('3333333-3', 'Sandra Aguilar', 933333333, 'Avenida 2', 1),
	('4444444-4', 'Esteban Jerez', 944444444, 'Avenida 3', 1),
	('5555555-5', 'Silvana Muñoz', 955555555, 'Pasaje 3', 1);


	insert into autores (codigo, nombre, apellido, nacimiento, muerte) values
	(3, 'Jose', 'Salgado', '1968', '2020'),
	(4, 'Ana', 'Salgado', '1972', NULL),
	(1, 'Andres', 'Ulloa', '1982', NULL),
	(2, 'Sergio', 'Mardones', '1950', '2012'),
	(5, 'Martin', 'Porta', '1976', NULL);

	insert into libros (isbn, titulo, paginas, dias_prestamo, stock) values 
	('111-1111111-111', 'Cuentos de terror', 344, 7, 1),
	('222-2222222-222', 'Poesias contemporaneas', 167, 7, 1),
	('333-3333333-333', 'Historia de Asia', 511, 14, 1),
	('444-4444444-444', 'Manual de mecanica', 298, 14, 1);

	insert into historial_prestamos (fecha_prestamo, fecha_devolucion, id_socios, id_libros) values 
	('20-01-2020', '27-01-2020', 1, 1),
	('20-01-2020', '30-01-2020', 5, 2),
	('22-01-2020', '30-01-2020', 3, 3),
	('23-01-2020', '30-01-2020', 4, 4),
	('27-01-2020', '04-02-2020', 2, 1),
	('31-01-2020', '12-02-2020', 1, 4),
	('31-01-2020', '12-02-2020', 3, 2);

	insert into libros_autores (tipo_autor , id_libros, id_autores) values 
	('Principal', 1, 1),
	('Coautora', 1, 2),
	('Principal', 2, 3),
	('Principal', 3, 4),
	('Principal', 4, 5);

3.a 
	select titulo, paginas from libros where paginas < 300 order by titulo;

3.b 
	select nombre, apellido, nacimiento from autores where nacimiento > 1970 order by nacimiento;

3.c 
	select l.titulo, 
	count(h.id_libros) as prestamos
	from historial_prestamos h inner join libros l 
	on l.id=h.id_libros group by titulo order by prestamos desc,titulo limit 3;

3.d 
	select 
	s.nombre as socio,
	l.titulo as libro,
	(h.fecha_devolucion-h.fecha_prestamo-7) as dias_de_atraso,
	(h.fecha_devolucion-h.fecha_prestamo-7)*100 as multa_por_atraso
	from historial_prestamos h inner join libros l 
	on l.id=h.id_libros
	inner join socios s on s.id = h.id_socios where (h.fecha_devolucion-h.fecha_prestamo) > 7;
