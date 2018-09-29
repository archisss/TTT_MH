#***************************************
#*               TIC TAC TOE           *
#* Desarrollado por José Carlos Anaya  *
#*         Ruby 2.3.0  versión 2.0     *
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
	#agrege el parametro valido para ver si puedo validar si cambia o no el jugador
	if jugador=="" then 
		#jugador sólo esta vacio cuando inicia el juego
		return "X"
	elsif jugador=="X" then 
		return "O"
	else
		return "X"
	end 
end 

def bye()
	system "clear"
	puts "************************************"
	puts "**        Team 4: Undefined       **"
	puts "**       MAGMA HACKERS 2018       **"
	puts "**    Thanks for play TicTacToe   **"  
	puts "**                                **" 
	puts "**                                **"   
	puts "**         Have a nice Day        **"
	puts "************************************"
	gets.chomp
end

def hi()
	system "clear"
		puts "************************************"
		puts "**        Team 4: Undefined       **"
		puts "**       MAGMA HACKERS 2018       **"
		puts "**     Welcome to the TicTacToe   **"    
		puts "**                                **"
		puts "**                                **"
		puts "**  Click to Rules . . .          **"
		puts "************************************"
		gets.chomp
		system "clear"
		puts "****************************************************"
		puts "**                    Team 4: Undefined           **"
		puts "**                   MAGMA HACKERS 2018           **"
		puts "**                Welcome to the TicTacToe   	  **"    
		puts "**                                                **"
		puts "**                  : GAME RULES :                **"
		puts "** - This is 3 x 3 game                           **"
		puts "** - Each player can select a position to play    **"
		puts "** - The player whos conect 3 symboles winns      **"
		puts "** - If at the 9 movement isn't a winner is a Draw**"
		puts "** - The fist player starts whit the X symbol     **"
		puts "**                                                **"
		puts "**  Ready to play. . .                            **"
		puts "****************************************************"
		gets.chomp
		system "clear"
end 

system "clear"
jugador=""
error=""
gana=false
i=1
finjuego = false
otro = ""
nocambiaj=false

hi()
while otro!="n" do
	if otro=="y" then #juego nuevo
		#Si se desea jugar otro juego hay que inicializar variables y saber quien gano el anterior
		system "clear"
		gana=false
		i=1
		finjuego = false
		nocambiaj=false
		otro = ""
		tableroJuego = [["0","0","0"],["0", "0","0"],["0", "0","0"]]
	end
	
	until gana==true || i>=(TAB_SIZE**2)+1 do
		#Cada que hay un movimiento se analiza si la posición seleccionada es valida
		#si es valida cambia el juador si no, se queda el mismo hasta que elija una valida	
		if nocambiaj==true then
			error=true
			nocambiaj=false
		else
			jugador = turno(jugador) 
		end 
		#begin	
			impTablero(tableroJuego)
			puts "Jugador #{jugador}"
			begin
				if error==true then 
					#puts "Jugador #{jugador}"
					error=false #se limpia el error porque se mandara a validar abajo
					puts "ERROR: La casilla ya fue seleccionada"
				end 
					puts "Movimiento #{i} ,Selecione una posición"	
				posicion = gets.chomp
			end until posicion =~ /^([1-9])$/

			if buscarvalor(tableroJuego,posicion,jugador)=="NV" then
				#enviar una validación a Turno para que no cambie el jugador
				system "clear"
				nocambiaj=true
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
			#Analizar si desea jugar otra partida el usuario
			if finjuego == true then 
				begin
					puts "Desea Jugar otra Partida (y/n) ?"
					otro = gets.chomp
				end until otro =~ /(y|n)$/ 
			end 
	end #until que exista ganador o se terminen los movimientos validos
end
bye()


