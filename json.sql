use instagram
go

-- Necesitamos 1 063 110 logs
-- Eso son 3272 logs por día, si tenemos unos 20 usuarios al día, ocupamos 163 logs por usuario
--declare @usuarios int = 200;
declare @dias int; -- Para saber cuantas filas hay en la tabla de días
declare @dia int; -- Contador para saber en que día estamos (para insertar los logs por día)
declare @logsXDia int;	-- Para saber cuantos logs se deben insertar cada día
declare @usuariosXDia int = 25; -- Saber la cantidad de usuarios por dia
declare @logsXUsuario int;	-- Sabemos la cantidad de logs de cada usuario
declare @contadorUsuarios int; -- contador para iterar a los usuarios del día
declare @low int = 0;
declare @low2 int = 0;

select @dias = max(D.id) from Dias D;

while(@low < @dias) -- Se itera por fechas para generar los log de x días juntos
begin
	-- logs que se deben insertar a un usuario
	select @logsXUsuario = ((D.fin - D.inicio) * (D.distribucion / 100)) / @usuariosXDia
	from Dias D
	where D.id = @dias;

	-- Dias totales en los que debemos insertar logs
	select @dia = (D.fin - D.inicio)
	from Dias D
	where D.id = @dias;

	while(@dia > 0) -- Se va a iterar por la cantidad de días 
	begin
		set @contadorUsuarios = @usuariosXDia;
		set @low2 = 0;
		while(@low2 < @contadorUsuarios) -- Se itera por usuarios para insertar los logs
		begin
			
			set @low2 = @low2 + 1;
		end
		set @dia = @dia - 1;
	end

set @low = @low + 1;
end

go

use master
go