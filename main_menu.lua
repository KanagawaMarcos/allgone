------------Códigos necessário para execução normal deste outro código-----------------
require 'interface_controller';
require 'sound_controller';
require 'game_controller';
require 'joystick_settings'
-----------Declaração de todas variaveis referentes ao menu principal------------------
background = love.graphics.newImage('Mobile - Ninja Heroes - Hidden Leaf Village.png');--Background do menu principal
background_x = -30;----------------------------------------------------------------------Posição X do background
background_y = -1;-----------------------------------------------------------------------Posição Y do background
transparency_going = true;---------------------------------------------------------------Controla efeito de imagem piscar na tela
transparency = 255;----------------------------------------------------------------------Atual valor da transparência


--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-------------------------------

function update_main_menu(dt)

	-----------------Toca o som do menu principal-------------------------
	play_this_song(sound.interface.main_menu_theme);
	----------------------------------------------------------------------

	------------------Sistema de piscar mensagem inicial------------------
	if(transparency_going)then--------------Se true, diminui a transparencia
		transparency = transparency - 3;----Decrementa transparencia 3x
		if(transparency <= 100)then---------Se a transparencia for <= 100
			transparency_going = false;-----Inicia o incremento da transparência
		end
	elseif(transparency_going == false)then
		transparency = transparency + 3;----Incrementa transparencia 3x
		if(transparency >= 255)then---------Se a transparencia for >= 255
			transparency_going = true;------Inicia decremento da transparência
		end
	end
	----------------------------------------------------------------------
end

function draw_main_menu()

	-------------------------Interface--------------------------------
	draw_this_image(background, background_x,background_y,.85);-----------Desenha o background
	draw_this_image(interface.ui.logo,270,20,1);--------------------------Desenha o logo do jogo
	----------------------Botão de play-------------------------------
	love.graphics.draw(interface.ui.canvas,510,450,0,0.32,0.2);-----------Desenha o pergaminho do play
	love.graphics.setColor(255,255,255,transparency);---------------------Colore o botão play
	draw_this_image(interface.ui.main_menu_button_start,525,475,.11);-----Desenha o botão play
	love.graphics.setColor(255,255,255);----------------------------------Normaliza as cores do jogo
	----------------------Botão de back--------------------------------
	love.graphics.draw(interface.ui.canvas,131,450,0,0.32,0.2);-----------Desenha o pergaminho do back
	love.graphics.setColor(255,255,255,transparency);---------------------Colore o botão back
	draw_this_image(interface.ui.main_menu_button_back,150,475,.11);-----Desenha o botão back
	love.graphics.setColor(255,255,255);----------------------------------Normaliza as cores do jogo
	
end

----------------------------FUNÇÕES DIVERSAS DO LOVE2D------------------------------

-----------------------Botões do menu principal----------------------
function main_menu_buttons()

	-----------------------------------Play---------------------------------------
	if(joystick_player.p1joystick:isGamepadDown(joystick_player.comands.start))then
		game_state = "stage1";
		play_this_song(sound.interface.main_menu_button_play);
	end
	------------------------------------------------------------------------------

	-----------------------------------Exit---------------------------------------
	if(joystick_player.p1joystick:isGamepadDown(joystick_player.comands.back))then
		love.event.quit();
	end
	------------------------------------------------------------------------------
	
end


