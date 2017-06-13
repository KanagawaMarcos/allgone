------------Códigos necessário para execução normal deste outro código----------------
require 'player_controller'
require 'game_controller'
----------------------------------FUNÇÕES BÁSICAS DO LOVE2D-----------------------------------
reset_player_pos = false;--Reinicia a posição do player

function physics_load()
	
	-------------------------Criação e configuração da física---------------------------------
	konoha = {};
	konoha.objects = {}; --------------------------------------------Armazena todos objetos e corpos físicos
	konoha.gravity = 9.81;-------------------------------------------Gravidade usada no mundo
	konoha.meter = 64;-----------------------------------------------Padrão de metros no mundo  1 metro = 64 pixels
	love.physics.setMeter(konoha.meter);-----------------------------Adiciona o padrão de metros
	konoha.world = love.physics.newWorld(0,konoha.gravity*64,true);--Criação do Mundo
	konoha.world:setCallbacks(begin_collision, end_collision,stay_on_collision);-------Cria as funções de colisão
	times_colliding = 0;---------------------------------------------Contador de quantas vezes a função Stay_On_Collision foi chamada	
	-------------------------------Criação da física do jogador---------------------------------
  	konoha.player = {}
  	konoha.player.body = love.physics.newBody(konoha.world, player.data.spawn_x, player.data.spawn_y, "dynamic");--Coloca o jogador no meio da tela e o torna dinâmico
  	konoha.player.shape = love.physics.newRectangleShape(player.data.x,player.data.y,player.data.w,player.data.h);--Define o formato do collider do player
  	konoha.player.fixture = love.physics.newFixture(konoha.player.body, konoha.player.shape, player.data.density);-- Junta o corpo físico com a imagem
  	-----------Configuração Jogador------------
  	konoha.player.fixture:setUserData("Player");--Dá a tag ao jogador para se indentificar
	konoha.player.body:setFixedRotation(true);----Impede o jogador de girar no proprio eixo
  	--------------------------------------------------------------------------------------------
  	-------------------------------Criação da física do inimigo---------------------------------
  	if(enemy.data.enable)then
  		konoha.enemy = {}
  		konoha.enemy.body = love.physics.newBody(konoha.world, enemy.data.spawn_x, enemy.data.spawn_y, "dynamic");--Coloca o inimigo no meio da tela e o torna dinâmico
  		konoha.enemy.shape = love.physics.newRectangleShape(enemy.data.x,enemy.data.y,enemy.data.w,enemy.data.h);--Define o formato do collider do player
  		konoha.enemy.fixture = love.physics.newFixture(konoha.enemy.body, konoha.enemy.shape, enemy.data.density);-- Junta o corpo físico com a imagem
  	    -----------Configuração Inimigo------------
	  	konoha.enemy.fixture:setUserData("Enemy");--Dá a tag ao jogador para se indentificar
		konoha.enemy.body:setFixedRotation(true);----Impede o jogador de girar no proprio eixo
	  	-------------------------------------------------------------------------------------------
  	end
  	------------Reseta a posição do player ao iniciar a fase------------
  	--if(game_state == "stage1")then----------------------Se o jogador está na fase 1
--		konoha.player.body:setPosition(player.data.spawn.stage1_x,player.data.spawn.stage1_y);----------Reinicia a posição do jogador			
--	end
--	if(game_state == "stage2")then----------------------Se o jogador está na fase 2
--		konoha.player.body:setPosition(player.data.spawn.stage2_x,player.data.spawn.stage2_y);----------Reinicia a posição do jogador				
--	end
--	if(game_state == "stage3")then----------------------Se o jogador está na fase 2
--		konoha.player.body:setPosition(player.data.spawn.stage3_x,player.data.spawn.stage3_y);----------Reinicia a posição do jogador				
--	end
--	if(game_state == "stage4")then----------------------Se o jogador está na fase 2
--		konoha.player.body:setPosition(player.data.spawn.stage4_x,player.data.spawn.stage4_y);----------Reinicia a posição do jogador				
--	end
  	
end

function physics_update(dt)
	-----Atualiza o universo físico a todo frame------
	konoha.world:update(dt);
	--------------------------------------------------
	
	if (reset_player_pos)then
		if(game_state == "stage1")then----------------------Se o jogador está na fase 1
			konoha.player.body:setPosition(player.data.spawn.stage1_x,player.data.spawn.stage1_y);----------Reinicia a posição do jogador			
		end
		if(game_state == "stage2")then----------------------Se o jogador está na fase 2
			konoha.player.body:setPosition(player.data.spawn.stage2_x,player.data.spawn.stage2_y);----------Reinicia a posição do jogador				
		end
		if(game_state == "stage3")then----------------------Se o jogador está na fase 2
			konoha.player.body:setPosition(player.data.spawn.stage3_x,player.data.spawn.stage3_y);----------Reinicia a posição do jogador				
		end
		if(game_state == "stage3")then----------------------Se o jogador está na fase 2
			konoha.player.body:setPosition(player.data.spawn.stage3_x,player.data.spawn.stage3_y);----------Reinicia a posição do jogador				
		end
    	reset_player_pos = false;
	end
	--------------------------------------------------
end

function physics_draw()

end
-----------------------------------------------------------------------------------------------


---------------------------------------FUNÇÕES DIVERSAS DO LOVE2D-----------------------------------

-------------------Funções Callback de colisões----------------
function begin_collision(a, b, coll)
	--------------Caso o jogador colida com algo--------------
	if(a:getUserData() == "Player" or b:getUserData() == "Player")then

		-----------Caso o jogador colida com uma plataforma-------------
		if(a:getUserData() == "Platform" or b:getUserData() == "Platform" )then
			player.data.is_landed = true;
			player.data.jumping = false;
			--player.data.taking_damage = false;
			player.data.idle = true;
		end
		-----------Caso o jogador colida com uma parede-------------
		if(a:getUserData() == "Wall" or b:getUserData() == "Wall")then
			
		end
		-----------Caso o jogador toque o final da fase 1-------------
		if(a:getUserData() == "Stage1_Final_Platform" or b:getUserData() == "Stage1_Final_Platform")then
			can_show_congratulation_message = true;
		end
		-----------Caso o jogador sai por baixo da fase-------------
		if(a:getUserData() == "Platform_Limit_Down" or b:getUserData() == "Platform_Limit_Down")then
			player.data.life = player.data.life - 50;----------------Retira uma vida do jogador
			if(player.data.life > 0)then---------------------------Se o jogador ainda tiver vida
				reset_player_pos = true;
				love.event.quit();----------------------------------Fecha o jogo
			end
		end
		-----------Caso o jogador colida com um inimigo-------------
		if(a:getUserData() == "Enemy" or b:getUserData() == "Enemy" and not player.data.atacking)then
			player.data.life = player.data.life - 25;----------------Retira uma vida do jogador
			enemy.data.atacking = true;
			--player.data.taking_damage = true;------------------------Ativa a animação de tomar dano
			if(player.data.life <= 0)then---------------------------Se o jogador ainda tiver vida
				love.event.quit();----------------------------------Fecha o jogo
			end
		end
		-----------Caso o jogador colida com um inimigo e o ataque-------------
		if(a:getUserData() == "Enemy" or b:getUserData() == "Enemy" and player.data.atacking)then
			--enemy.data.life = enemy.data.life - 150;----------------Retira uma vida do jogador
			--konoha.enemy.body:destroy()
		end

	end
end
 
function end_collision(a, b, coll)
	-----------Caso o jogador deixe de colidir com algo-----------
	if(a:getUserData() == "Player" or b:getUserData() == "Player")then

		-----------Caso o jogador deixe de colidir com uma plataforma-------------
		if(a:getUserData() == "Platform" or b:getUserData() == "Platform")then
			player.data.is_landed = false;
			player.data.idle = false;
			player.data.walking = false;
			player.data.runing = false;
			player.data.jumping = true;
		end
		-----------Caso o jogador deixe de colidir com uma parede-------------
		if(a:getUserData() == "Wall" or b:getUserData() == "Wall")then
			--player.data.is_landed = false;
		end
		-----------Caso o jogador deixe de colidir com um inimigo-------------
		if(a:getUserData() == "Enemy" or b:getUserData() == "Enemy")then
			--player.data.taking_damage = false;
		end
		
	end
end

function stay_on_collision(a, b, coll)
	-----------Caso o jogador colida com um inimigo e o ataque-------------
		if(a:getUserData() == "Enemy" or b:getUserData() == "Enemy" and player.data.atacking)then
			--enemy.data.life = enemy.data.life - 150;----------------Retira uma vida do jogador
			konoha.enemy.enable = false;
		end
end

-----------------------Movimentação do player----------------------------

-------------------Movimenta o player para a direita---------------------
function walk_player_right(dt)
	konoha.player.body:setLinearVelocity(player.data.speed*2,0);
end

-------------------Movimenta o player para a esquerda---------------------
function walk_player_left(dt)
	konoha.player.body:setLinearVelocity(-player.data.speed*2,0);
end

------------Movimenta o player para a direita rapidamente----------------
function run_player_right(dt)
	konoha.player.body:setLinearVelocity(player.data.run_speed*2.7,0);
end

------------Movimenta o player para a esquerda rapidamente----------------
function run_player_left(dt)
	konoha.player.body:setLinearVelocity(-player.data.run_speed*2.7,0);
end

----------------------Para o movimento do player--------------------------
function stop_moviment()
	--konoha.player.body:setLinearVelocity(0,0);--DESATIVE QUANDO INDENTIFICAR COLISÃO COM O CHÃO
end

-----------------------Movimenta o player para cima-----------------------
function jump_player_right(dt)
	konoha.player.body:setLinearVelocity(0,-player.data.jump_force*2);
end


------------Movimenta o player para os lados enquanto pula----------------
function jump_player_applyforce(side,dt)
	if(side == "right")then
		konoha.player.body:applyForce(player.data.speed*2,0);---Aplica uma força no corpo para se mover no ar
		player.data.direction = "right";-----------------------------Muda a posição da animação ao mover-se no ar
	elseif (side == "left")then
		konoha.player.body:applyForce(-player.data.speed*2,0);--Aplica uma força no corpo para se mover no ar
		player.data.direction = "left";------------------------------Muda a posição da animação ao mover-se no ar
	else

	end
end

-------------------------------------------------------------------------

