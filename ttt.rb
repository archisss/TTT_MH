#***************************************
#*               TIC TAC TOE           *
#* Desarrollado por José Carlos Anaya  *
#* Ruby 2.3.0  versión 1.0             *
#***************************************

TAB_SIZE = 3
TABLEROREF = [["1","2","3"],["4", "5","6"],["7", "8","9"]]
tableroJuego = [["0","0","0"],["0", "0","0"],["0", "0","0"]]

#impresion del tablero
def impTablero(matriz)
	puts " TIC TAC TOE v1.0"
	puts "POSICIONES DE REFERENCIA "
	TABLEROREF.each_with_index do |e, row, col|
		puts "#{e}" 
	end
	puts "EL JUEGO ACTUAL "
	matriz.each_with_index do |e, row, col|
		puts "#{e}" 
	end
end

def buscarvalor(matriz,posicion,jugador)
	for x in 0...TAB_SIZE
		for y in 0...TAB_SIZE
			if TABLEROREF[x][y] == posicion then 
				#puts "encontrado y es #{x} , #{y}"
				if matriz[x][y] != "X" && matriz[x][y] != "O" then
					matriz[x][y] = jugador
					return "OK"
				else
					#puts "Si la posicion ya fue tomada se manda mensaje al usuario"
					return "NV"
				end
			end 
		end 
	end
end 

def existeGanador(matriz,jugador)
	ganador = false
	case
		#Horizontales
		when matriz[0][0]==jugador && matriz[0][1]==jugador && matriz[0][2]==jugador
			ganador = true
		when matriz[1][0]==jugador && matriz[1][1]==jugador && matriz[1][2]==jugador
			ganador = true
		when matriz[2][0]==jugador && matriz[2][1]==jugador && matriz[2][2]==jugador
			ganador = true
		#Verticales
		when matriz[0][0]==jugador && matriz[1][0]==jugador && matriz[2][0]==jugador
			ganador = true
		when matriz[0][1]==jugador && matriz[1][1]==jugador && matriz[2][1]==jugador
			ganador = true
		when matriz[0][2]==jugador && matriz[1][2]==jugador && matriz[2][2]==jugador
			ganador = true
		#Diagonales
		when matriz[0][0]==jugador && matriz[1][1]==jugador && matriz[2][2]==jugador
			ganador = true
		when matriz[0][2]==jugador && matriz[1][1]==jugador && matriz[2][0]==jugador
			ganador = true
	end
	return ganador
end

def turno(jugador)
	if jugador=="" then 
		return "X"
	elsif jugador=="X" then 
		return "O"
	else
		return "X"
	end 
end 

system "clear"
jugador=""
gana=false
i=1
finjuego = false
otro = ""
while otro!="n" do
	if otro=="y" then 
		#Si se desea jugar otro juego hay que inicializar variables y saber quien gano el anterior
		system "clear"
		gana=false
		i=1
		finjuego = false
		otro = ""
		tableroJuego = [["0","0","0"],["0", "0","0"],["0", "0","0"]]
	end
	until gana==true || i>=(TAB_SIZE**2)+1 do
	jugador = turno(jugador)
	impTablero(tableroJuego)
	puts "Jugador #{jugador}"
	puts "Movimiento #{i} ,Selecione una posición"
	posicion = gets.chomp
		if buscarvalor(tableroJuego,posicion,jugador)=="NV" then 
			impTablero(tableroJuego)
			puts "ERROR: Jugador #{jugador}"
			puts "El movimiento #{i} no fue valido o la casilla ya fue seleccionada"
			puts "Selecione otra posición"	
		else
			gana=existeGanador(tableroJuego,jugador)
			system "clear"
			#Valido posible empate o termino del JUEGO
			if(gana==false && i==9) then
				impTablero(tableroJuego)
				puts "*** EMPATE EN EL JUEGO ***"
				finjuego = true
			elsif (gana==true) then 
				impTablero(tableroJuego)
				puts "*** GANA EL JUGADOR #{jugador} ***"
				finjuego = true
			end 
			i+=1
		end 
		if finjuego == true then 
			puts "Desea Jugar otra Partida (y/n) ?"
			otro = gets.chomp
		end 
	end
end


