use master
go

/*
El siguiente segmento de código es para manejar el error de crearuna base de datos
existente, si la base de datos existe se borra y se crea una nueva.
*/

if(exists(select * from sysdatabases where name = 'instagram'))
begin
	drop database [instagram]
	create database [instagram]
end
else
begin 
	create database [instagram]
end
go


use [instagram]
go

create table Tags
(
	id int identity(1,1) primary key not null,
	tag varchar(50) not null
)

create table TimeTable
(
	id int identity(1,1) primary key not null,
	startTime nvarchar(50),
	endTime nvarchar(50)
)


create table ActionTable
(
	id int identity(1,1) primary key not null,
	porcent int,
	actionName nvarchar(50),
	initialRange int,
	finalRange int,
	content bit
)

create table Ubicaciones
(
	id int identity(1,1) primary key not null,
	lat float,
	lon float,
	point as [geography]::Point([lat], [lon], 4326)
)


create table Dias
(
	id int identity(1,1) primary key not null,
	inicio int, -- en días, no en decha
	fin int,
	distribucion int
)


insert into Dias(inicio, fin, distribucion)
values(1, 80, 48),
(81, 130, 27),
(131, 115, 25)

insert into Tags(tag)
values('futbol'),
('tec'),
('casa'),
('estudio'),
('cine'),
('viaje'),
('comida'),
('alcohol'),
('juegos'),
('gym'),
('amigos'),
('tv'),
('pal feis'),
('telefono'),
('google'),
('facebook'),
('instagram'),
('ayuda'),
('perro'),
('gato'),
('peces'),
('amarson'),
('nuñez'),
('fail'),
('help me'),
('verdadero'),
('mentira'),
('ventilador'),
('cartago'),
('plantas'),
('pc'),
('mp3'),
('mono'),
('modelo'),
('dubai'),
('paracaidas'),
('xiaomi'),
('apple'),
('china'),
('chernobyl'),
('putin'),
('motherrussia'),
('deadpool'),
('camisa'),
('mentira'),
('pantalon'),
('4:20'),
('co2'),
('o2'),
('azucar'),
('celiacruz'),
('spotify'),
('basesdedatos2'),
('json'),
('ssd'),
('teclado'),
('sqlserver')

-- Inserciones de tiempo

insert into TimeTable(startTime,endTime)
values('6:00am', '9:00am'),
('12:00md', '1:00pm'),
('9:00pm', '11:00pm'),
('00:01am', '6:00am')





-- Inserciones de la tabla de acciones
insert into ActionTable(porcent, actionName, initialRange, finalRange, content)
values(56, 'Post', 0, 55, 1),
(26, 'Stories', 56, 81, 1),
(7, 'Chat', 82, 88, 0),
(4, 'Contenido', 89, 92, 1),
(3, 'Profile', 93, 95, 0),
(4, 'Search', 96, 99, 0)

-- Agregar ubicaciones
insert into Ubicaciones(lat, lon)
values(9.894305,  83.997175)


