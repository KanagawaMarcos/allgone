------------Códigos necessário para execução normal deste outro código---------
require 'player_controller';
require 'sound_controller';
require 'physic_controller';
require 'game_controller';
-------------------------------------------------------------------------------
-------------Declaração de todas variaveis referentes ao controle principal-------------
joystick_player = {};
--------------------------Todas informações sobre o controle----------------
joystick_player.p1joystick = nil;
joystick_player.data = {}
joystick_player.data.is_connected = false;
joystick_player.data.last_button_pressed = "";
joystick_player.data.is_vibration_suported = false;
joystick_player.data.left_x = 0;
joystick_player.data.left_y = 0;
joystick_player.data.reverse_movement = 1;--Inverte o movimento do jogador se (-1)
---------------------------Todos os botões e suas ações--------------------------
joystick_player.comands = {};
joystick_player.comands.atack = "x";
joystick_player.comands.run = "y";
joystick_player.comands.jump = "a";
joystick_player.comands.start = "start";
joystick_player.comands.back = "back";

timer_puch = 0



--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-------------------------------

function joystick_load()
	
end

function joystick_update(dt)
	----------Configura o controlle caso ele esteja conectado.-----------
	set_joystick_config();
	---------------------------------------------------------------------

	--------------------------Execução do movimento de pulo-----------------------------
	if(joystick_player.p1joystick:isGamepadDown(joystick_player.comands.jump) and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false)then
		jump_player_right(dt);
		player.data.jumping = true;
		player.data.idle = false;
		player.data.walking = false;
		player.data.runing = false;
		play_this_song(sound.player.jump);
		play_this_song(sound.player.jump_voice);
		--quando o player pula ativa a bool de pulo, quando colide com o chão ele desativa ela
	end
	------------------------------------------------------------------------------------

	--[[--------------------------Execução do ataque-----------------------------
	if(joystick_player.p1joystick:isGamepadDown(joystick_player.comands.atack) and player.data.is_landed and not player.data.crouching and not player.data.jumping and not player.data.atacking and not player.data.walking and not player.data.runing)then
		player.data.atacking = true;
		player.data.jumping = false;
		player.data.idle = false;
		player.data.walking = false;
		player.data.runing = false;
		play_this_song(sound.player.jump_voice);
	end]]
	------------------------------------------------------------------------------------

	----------------------Execução do movimento enquanto pula---------------------------
	if(joystick_player.data.left_x > 0 and player.data.jumping == true)then
		jump_player_applyforce("right",dt);
	elseif(joystick_player.data.left_x < 0 and player.data.jumping == true)then
		jump_player_applyforce("left",dt);
	end
	------------------------------------------------------------------------------------

	--------------------------Execução do movimento de correr---------------------------
	if(joystick_player.data.left_x > 0 and joystick_player.p1joystick:isGamepadDown(joystick_player.comands.run) and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false)then
		run_player_right(dt);
		player.data.walking = false;
		player.data.idle = false;
		player.data.runing = true;
		player.data.direction = "right";
		play_this_song(sound.player.runing);
	elseif(joystick_player.data.left_x < 0 and joystick_player.p1joystick:isGamepadDown(joystick_player.comands.run) and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false)then
		run_player_left(dt);
		player.data.walking = false;
		player.data.idle = false;
		player.data.runing = true;
		player.data.direction = "left";
		play_this_song(sound.player.runing);
	elseif(joystick_player.data.left_x == 0 and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false) then
		player.data.runing = false;
		player.data.walking = false;
		player.data.idle = true;
		stop_this_song(sound.player.runing);
	elseif
	-------------------------------------------------------------------------------------

	--------------------------Execução do movimento de andar-----------------------------
	(joystick_player.data.left_x > 0 and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false)then
		walk_player_right(dt);
		player.data.walking = true;
		player.data.idle = false;
		player.data.direction = "right";
	elseif(joystick_player.data.left_x < 0 and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false)then
		walk_player_left(dt);
		player.data.walking = true;
		player.data.idle = false;
		player.data.direction = "left";
	elseif(joystick_player.data.left_x == 0 and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false and player.data.atacking == false) then
		player.data.walking = false;
		player.data.idle = true;
	end
	--------------------------------------------------------------------------------------

	---------------------Mudança da fase ao final de outra--------------------------------
	if(joystick_player.p1joystick:isGamepadDown(joystick_player.comands.start) and can_show_congratulation_message)then
		if(game_state == "stage1")then------------------------------------------Caso esteja na fase 1
			game_state = "stage2";----------------------------------------------Vá para a fase 2
			reset_player_pos = true;
			player.data.is_landed = false;
			physics_load();-----------------------------------------------------Reinicia a física do jogo
			can_show_congratulation_message = false;----------------------------Desativar a mensagem de parabéns
		elseif(game_state == "stage2" and can_show_congratulation_message)then--Caso esteja na fase 2
			enemy.data.enable = true;-------------------------------------------Ativa o inimigo para a proxima fase
			game_state = "stage3";----------------------------------------------Vá para a fase 3
			reset_player_pos = true;
			player.data.is_landed = false;			
			physics_load();-----------------------------------------------------Reinicia a física do jogo
			can_show_congratulation_message = false;----------------------------Desativar a mensagem de parabéns
		elseif(game_state == "stage3" and can_show_congratulation_message)then--Caso esteja na fase 3
			--konoha.enemy.body:setPosition(-10,-10);----------Reinicia a posição do inimigo (gambiarra de ultima hora)
			enemy.data.enable = false;-------------------------------------------Ativa o inimigo para a proxima fase
			game_state = "stage4";----------------------------------------------Vá para a fase 4
			reset_player_pos = true;
			player.data.is_landed = false;
			physics_load();-----------------------------------------------------Reinicia a física do jogo
			can_show_congratulation_message = false;----------------------------Desativar a mensagem de parabéns
		elseif(game_state == "stage4" and can_show_congratulation_message)then--Caso esteja na fase 3
			enemy.data.enable = false;------------------------------------------Ativa o inimigo para a proxima fase
			player.data.life = 150;---------------------------------------------Reinicia a física do jogo
			can_show_congratulation_message = false;----------------------------Desativar a mensagem de parabéns
			love.event.quit();
		end
	end
	---------------------------------------------------------------------------------------


	--Execução do ataque (no chão)--CONCERTE O BUG DE FICAR MOSTRANDO A ANIMAÇÃO SEM PARAR(parar a animação ao fim dela, porém a animação só dura um quadro)
	--if(joystick_player.data.last_button_pressed == joystick_player.comands.atack and player.data.atacking == false and player.data.is_landed == true and player.data.crouching == false and player.data.jumping == false)then
	--	player.data.walking = false;
	--	player.data.runing = false;
	--	player.data.idle = false;
	--	player.data.can_move = false;
	--	player.data.atacking = true;
	--end
	--
end

function joystick_draw()
	love.graphics.newFont(20);
	--love.graphics.print("Last gamepad button pressed: "..joystick_player.data.last_button_pressed, 10, 10);
end
--------------------------------------------------------------------------------------------------------


-----------------------------------FUNÇÕES DIVERSAS DO LOVE2D-----------------------------------------

-------------Verifica se algum controle foi adicionado-------------
function love.joystickadded(joystick)
	if joystick == nil then

	else
    	joystick_player.p1joystick = joystick;
    	joystick_player.data.is_connected = true;
    	love.joystick.saveGamepadMappings("controles" )
	end
end
-------------------------------------------------------------------

-------------Verfica se algum controle foi removido----------------
function love.joystickremoved(joystick)
	joystick_player.data.is_connected = false;
end
-------------------------------------------------------------------

-------Configura as variaveis referente ao controle----------------
function set_joystick_config()
	if(joystick_player.data.is_connected == true)then
		joystick_player.data.left_x = joystick_player.p1joystick:getGamepadAxis("leftx");
		joystick_player.data.left_y = joystick_player.p1joystick:getGamepadAxis("lefty");
		joystick_player.data.is_vibration_suported = joystick_player.p1joystick:isVibrationSupported();
	else
		joystick_player.data.left_x = 0;--Nunca coloque nil aqui, irá dar um erro de comparação em algumas condições
		joystick_player.data.left_y = 0;--Nunca coloque nil aqui, irá dar um erro de comparação em algumas condições
		joystick_player.data.is_vibration_suported = nil;
	end
end
-------------------------------------------------------------------

--------------Armazena o ultimo botão pressionado------------------
function love.gamepadpressed(joystick, button)
    joystick_player.data.last_button_pressed = button;
    if(button == nil)then
    	joystick_player.data.last_button_pressed = "";
    end
end
--------------------------------------------------------------------