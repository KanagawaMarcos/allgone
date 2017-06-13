------------Códigos necessário para execução normal deste outro código-----------------
require 'player_controller';
require 'sound_controller';
------------Declaração de todas variaveis referentes ao game controller----------------

-----------Todas informações sobre a camera-------------
camera = {};
camera.x = 0;
camera.y = 0;
camera.scaleX = 1;
camera.scaleY = 1;
camera.rotation = 0;
-----------Todas informações sobre o mouse-------------
mouse_x = 0;
mouse_y = 0;
------------Todas estátisticas do jogador--------------
statistics = {};
statistics.time_level_completed = 0;
statistics.score = 0;


naruto_font = love.graphics.newFont("njnaruto.ttf",18);


game_state = "main_menu"---Status atual do jogo

can_show_congratulation_message = false;
can_play_congratulation_song = true;
congratulation_image = love.graphics.newImage('naruto_message.png');

--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-------------------------------

function game_controller_update(dt)

	mouse_x = love.mouse.getX();-------Posição x do mouse
	mouse_y = love.mouse.getY();-------Posição y do mouse

	---------------------Tempo completando a fase---------------------------
	if(can_show_congratulation_message == false)then
		statistics.time_level_completed = statistics.time_level_completed + dt;
	else

	end
	------------------------------------------------------------------------
end


----------------------------FUNÇÕES DIVERSAS DO LOVE2D---------------------------

------------Mensagem de parabéns ao fim da fase-----------
function game_controller_draw()
	if(can_show_congratulation_message)then		
		draw_this_image(congratulation_image, 190,150);--Imagem de congratulation
		love.graphics.setColor(0,0,0);
		love.graphics.setFont(naruto_font);
		love.graphics.print("Score: ".. statistics.score, 300, 250, 0, 1.5, 1.5);
		love.graphics.print("Tempo: "..math.floor(statistics.time_level_completed).." seg", 300, 290, 0, 1.5, 1.5);
		if(game_state ~= "stage3")then --------------Para não bugar o "efeito" de noite na fase 3
			love.graphics.setColor(255,255,255);-------------Normaliza a cor da fase
		else
			love.graphics.setColor(25, 70, 112);-------------Deixa a fase a noite
		end

		if(can_play_congratulation_song)then
			play_this_song(sound.interface.congratulation);
			can_play_congratulation_song = false;
		end
	end
end

-----------------Camera-------------------
function camera_follow_player()
	----------Modulo da camera-----------
	--camera:set(); 
  	-------------------------------------
	-----------------Movimenta a camera para seguir o jogador-------------------
	if(konoha.player.body:getX() > love.graphics.getWidth()/2)then
		camera.x = konoha.player.body:getX() - love.graphics.getWidth()/2
	end
	----------------------------------------------------------------------------
	 ----------Modulo da camera-----------
	--camera:unset();
	------------------------------------- 
	
end

function camera:set()
  love.graphics.push()
  love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
  love.graphics.pop()
end

function camera:move(dx, dy)
  self.x = self.x + (dx or 0)
  self.y = self.y + (dy or 0)
end

