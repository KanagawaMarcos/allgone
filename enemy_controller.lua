------------Códigos necessário para execução normal deste outro código----------------
anim8 = require 'anim8'; 
-----------Declaração de todas variaveis referentes ao jogador principal---------------
enemy = {};
--------------------------Todas informações sobre o jogador----------------
enemy.data = {};
enemy.data.enable = false;
enemy.data.x = 30;--Posição X do jogador (Canto esquerdo superior da imagem)100
enemy.data.y = 27;--Posição Y do jogador (Canto esquerdo superior da imagem)100
enemy.data.w = 40;--Largura do jogador (Canto direito inferior da imagem)50
enemy.data.h = 55;--Altura do jogador (Canto direito inferior da imagem)50
enemy.data.spawn_x = 400;
enemy.data.spawn_y = 300;
enemy.data.spawn_2_x = 400;
enemy.data.spawn_2_y = 300;
enemy.data.life = 3;--Vida do jogador
enemy.data.speed = 50;--Velocidade do jogador andando
enemy.data.run_speed = 200;--Velocidade do jogador correndo
enemy.data.jump_force = 150;--Força do pulo do jogador
enemy.data.gravity = 3;--Gravidade aplicada sobre o jogador (Essa variavel ficará absoleta no proximo update)
enemy.data.density = 4;--Densidade do jogador
enemy.data.friction = 1.0;--Fricição do jogador no mundo físico
enemy.data.is_landed = true;--Status: Tocando o chão
enemy.data.idle = false;--Status: Parado
enemy.data.walking = false;--Status: Andando
enemy.data.runing = true;--Status: Correndo
enemy.data.jumping = false;--Status: Pulando
enemy.data.crouching = false;--Status: Agachando
enemy.data.atacking = false;--Status: Atacando
enemy.data.die = false;--Status: Atacando
enemy.data.is_using_jutsu = false;--Status: Usando um Jutsu
enemy.data.direction = "right";--Para qual lado o jogador está olhando("left" = esquerda, "right" = direita)
----------------------------Todos os jutsus do jogador-----------------------
enemy.jutsus = {}
enemy.jutsus.rasengan = {};--Todas informações referents ao jutsu do Rasengan
enemy.jutsus.rasengan.description = "O Rasengan é uma técnica poderosa de classificação A inventada pelo Quarto Hokage, que a criou observando a formação da Bola da Besta com Cauda. É a manipulação de chakra puro, em forma de uma esfera espiral de chakra.";
enemy.jutsus.rasengan.damage = 200;--Valor do dano causado no inimigo pelo rasengan
enemy.jutsus.rasengan.bought = false;--Variavel responsavel por dizer se o jogador já comprou ou não esse jutsu

------------------------Sprites Sheet do jogador------------------------
enemy.spritesheet = love.graphics.newImage("sasuke_sheet.png");
------------------------------------------------------------------------

--------------------------Declaração de todos os grids do jogador----------------------
----PARAMETROS:Largura e altura da animação, largura e altura da imagem,pontos X e Y onde a imagem da animação começa(Origem)
enemy.grid = {};
enemy.grid.idle = anim8.newGrid(38,56,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),1,277);
enemy.grid.run = anim8.newGrid(57,49,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),3,356);
enemy.grid.atack = anim8.newGrid(53,56,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),0,943);
enemy.grid.die = anim8.newGrid(66,34,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),530,642);

-----Não configuradas
enemy.grid.walk = anim8.newGrid(59,50,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),1,240);
enemy.grid.crouch = anim8.newGrid(53,48,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),9,384);
enemy.grid.jump = anim8.newGrid(50,52,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),7,308);
enemy.grid.jump_end = anim8.newGrid(75,59,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),214,309);
enemy.grid.atack_jump = anim8.newGrid(60,61,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),262,522);
enemy.grid.damage = anim8.newGrid(50,54,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),14,1956);
enemy.grid.throw = anim8.newGrid(65,53,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),0,863);
enemy.grid.throw_jump = anim8.newGrid(53,59,enemy.spritesheet:getWidth(),enemy.spritesheet:getHeight(),442,856);


------------------------Declaração de todas animações do jogador------------------------
----PARAMETROS: Grid,Colunas da animação no sprite, linha, velocidade de execução-------
enemy.animation = {};
enemy.animation.idle_right = anim8.newAnimation(enemy.grid.idle('1-4',1),0.12);
enemy.animation.idle_left = anim8.newAnimation(enemy.grid.idle('1-4',1),0.12):flipH();
enemy.animation.walk_right = anim8.newAnimation(enemy.grid.walk('1-6',1),0.1);
enemy.animation.walk_left = anim8.newAnimation(enemy.grid.walk('1-6',1),0.1):flipH();
enemy.animation.atack_right = anim8.newAnimation(enemy.grid.atack('1-3',1),0.1);--Pra fazer combo terá que mudar a string da coluna em tempo real
enemy.animation.atack_left = anim8.newAnimation(enemy.grid.atack('1-3',1),0.1):flipH();--Pra fazer combo terá que mudar a string da coluna em tempo real
enemy.animation.die_right = anim8.newAnimation(enemy.grid.die('1-1',1),0.12,'pauseAtEnd');
enemy.animation.die_left = anim8.newAnimation(enemy.grid.die('1-1',1),0.12,'pauseAtEnd'):flipH();

enemy.animation.run_right = anim8.newAnimation(enemy.grid.run('1-6',1),0.1);
enemy.animation.run_left = anim8.newAnimation(enemy.grid.run('1-6',1),0.1):flipH();
enemy.animation.crouch_right = anim8.newAnimation(enemy.grid.crouch('1-4',1),0.1);
enemy.animation.crouch_left = anim8.newAnimation(enemy.grid.crouch('1-4',1),0.1):flipH();
enemy.animation.jump_right = anim8.newAnimation(enemy.grid.jump('1-4',1),0.8,'pauseAtEnd');
enemy.animation.jump_left = anim8.newAnimation(enemy.grid.jump('1-4',1),0.8,'pauseAtEnd'):flipH();
enemy.animation.jump_end_right = anim8.newAnimation(enemy.grid.jump_end('1-6',1),0.1);
enemy.animation.jump_end_left = anim8.newAnimation(enemy.grid.jump_end('1-6',1),0.1):flipH();
enemy.animation.atack_jump_right = anim8.newAnimation(enemy.grid.atack_jump('1-3',1),0.12);
enemy.animation.atack_jump_left = anim8.newAnimation(enemy.grid.atack_jump('1-3',1),0.12):flipH();
enemy.animation.damage_right = anim8.newAnimation(enemy.grid.damage('1-1',1),0.1);
enemy.animation.damage_left = anim8.newAnimation(enemy.grid.damage('1-1',1),0.1):flipH();
enemy.animation.throw_right = anim8.newAnimation(enemy.grid.throw('1-3',1),0.12);
enemy.animation.throw_left = anim8.newAnimation(enemy.grid.throw('1-3',1),0.12):flipH();
enemy.animation.throw_jump_right = anim8.newAnimation(enemy.grid.throw_jump('1-3',1),0.12);
enemy.animation.throw_jump_left = anim8.newAnimation(enemy.grid.throw_jump('1-3',1),0.12):flipH();

--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-------------------------------
function animation_load()

end

function enemy_animation_update(dt)
	
	------------------Timer Soco--------------------
	if(enemy.data.atacking)then
		timer_puch = timer_puch + dt;
		if(timer_puch >= .3)then
			enemy.data.atacking = false;
			--stop_this_song(sound.enemy.jump_voice);
		end
	else
		timer_puch = 0;
	end
	------------------------------------------------
	-----------Função resposavel por controlar os estados do jogador---------------------
	--enemy_state_controller();--!!FUNÇÃO BUGADA!! NÃO REATIVE
	------------------------Animações do personagem sendo carregadas---------------------
	-----------------------------------Parado---------------------------------------------
	enemy.animation.idle_right:update(dt);--------Atualiza a animação virada para direita
	enemy.animation.idle_left:update(dt);---------Atualiza a animação virada para esquerda
	
	----------------------------------Andando---------------------------------------------
	enemy.animation.walk_right:update(dt);--------Atualiza a animação virada para direita
	enemy.animation.walk_left:update(dt);---------Atualiza a animação virada para esquerda

	----------------------------------Atacando--------------------------------------------
	enemy.animation.atack_right:update(dt);-------Atualiza a animação virada para direita
	enemy.animation.atack_left:update(dt);--------Atualiza a animação virada para esquerda

	----------------------------------Correndo--------------------------------------------
	enemy.animation.run_right:update(dt);---------Atualiza a animação virada para direita
	enemy.animation.run_left:update(dt);----------Atualiza a animação virada para esquerda

	----------------------------------Agachando-------------------------------------------
	enemy.animation.crouch_right:update(dt);------Atualiza a animação virada para direita
	enemy.animation.crouch_left:update(dt);-------Atualiza a animação virada para esquerda

	----------------------------------Pulando---------------------------------------------
	enemy.animation.jump_right:update(dt);--------Atualiza a animação virada para direita
	enemy.animation.jump_left:update(dt);---------Atualiza a animação virada para esquerda

	----------------------------Tocando o chão pós pulo-----------------------------------
	enemy.animation.jump_end_right:update(dt);----Atualiza a animação virada para direita
	enemy.animation.jump_end_left:update(dt);-----Atualiza a animação virada para esquerda

	------------------------------Ataque pulando------------------------------------------
	enemy.animation.atack_jump_right:update(dt);--Atualiza a animação virada para direita
	enemy.animation.atack_jump_left:update(dt);---Atualiza a animação virada para esquerda

	-------------------------------Tomando dano-------------------------------------------
	enemy.animation.damage_right:update(dt);------Atualiza a animação virada para direita
	enemy.animation.damage_left:update(dt);-------Atualiza a animação virada para esquerda

	-----------------------------Arremessando algo----------------------------------------
	enemy.animation.throw_right:update(dt);-------Atualiza a animação virada para direita
	enemy.animation.throw_left:update(dt);--------Atualiza a animação virada para esquerda

	-----------------------Arremessando algo enquanto pula--------------------------------
	enemy.animation.throw_jump_right:update(dt);--Atualiza a animação virada para direita
	enemy.animation.throw_jump_left:update(dt);---Atualiza a animação virada para esquerda

	----------------------------------Morrendo--------------------------------------------
	enemy.animation.die_right:update(dt);---------Atualiza a animação virada para direita
	enemy.animation.die_left:update(dt);----------Atualiza a animação virada para esquerda
	--------------------------------------------------------------------------------------
	
end

function enemy_animation_draw()
	
	----------------------------------Desenha a animação de idle na tela------------------------------------------
	if(enemy.data.idle and enemy.data.direction == "right" and not enemy.data.walking and not enemy.data.die)then
		enemy.animation.idle_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	elseif(enemy.data.idle and enemy.data.direction == "left" and not enemy.data.walking and not enemy.data.die)then
		enemy.animation.idle_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	end
	
	---------------------------------Desenha a animação de correr na tela------------------------------------------
	if(enemy.data.runing and enemy.data.direction == "right" and enemy.data.is_landed and not enemy.data.jumping and not enemy.data.crouching and not enemy.data.atacking and not enemy.data.walking and not enemy.data.die)then
		enemy.animation.run_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY()+10);
		--play_this_song(sound.enemy.runing);
	elseif(enemy.data.runing and enemy.data.direction == "left" and enemy.data.is_landed and not enemy.data.jumping and not enemy.data.crouching and not enemy.data.atacking and not enemy.data.walking and not enemy.data.die)then
		enemy.animation.run_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY()+10);
		--play_this_song(sound.enemy.runing);
	end

	---------------------------------Desenha a animação de atacar na tela------------------------------------------
	if( enemy.data.direction == "right" and enemy.data.runing == false and enemy.data.is_landed == true and enemy.data.jumping == false and enemy.data.crouching == false and enemy.data.atacking == true and enemy.data.walking == false and enemy.data.die == false)then
		enemy.animation.atack_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	elseif(enemy.data.direction == "left" and enemy.data.runing == true and enemy.data.is_landed == true and enemy.data.jumping == false and enemy.data.crouching == false and enemy.data.atacking == true and enemy.data.walking == false and enemy.data.die == false)then
		enemy.animation.atack_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	end

	--------------------------------Desenha a animação de morte------------------------------------------
	if(enemy.data.die == true and enemy.data.walking == false and enemy.data.direction == "right" and enemy.data.is_landed == true and enemy.data.jumping == false and enemy.data.crouching == false and enemy.data.atacking == false)then
		enemy.animation.die_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	elseif(enemy.data.die == true and enemy.data.walking == false and enemy.data.direction == "left" and enemy.data.is_landed == true and enemy.data.jumping == false and enemy.data.crouching == false and enemy.data.atacking == false)then
		enemy.animation.die_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	end

	---------------------------------Desenha a animação de atacar------------------------------------------
	if(enemy.data.direction == "right" and enemy.data.atacking and enemy.data.is_landed and not enemy.data.jumping and not enemy.data.taking_damage and not enemy.data.walking and not enemy.data.crouching and not enemy.data.runing)then
		enemy.animation.atack_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	elseif(enemy.data.direction == "left" and enemy.data.atacking and enemy.data.is_landed and not enemy.data.jumping and not enemy.data.taking_damage and not enemy.data.walking and not enemy.data.crouching and not enemy.data.runing)then
		enemy.animation.atack_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	end
	-------------------------------------------------------------------------------------------------------

	--[[
	---------------------------------Desenha a animação de andar na tela------------------------------------------
	if(enemy.data.walking == true and enemy.data.direction == "right" and enemy.data.is_landed == true and enemy.data.jumping == false and enemy.data.crouching == false and enemy.data.atacking == false)then
		enemy.animation.walk_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	elseif(enemy.data.walking == true and enemy.data.direction == "left" and enemy.data.is_landed == true and enemy.data.jumping == false and enemy.data.crouching == false and enemy.data.atacking == false)then
		enemy.animation.walk_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
	end

	---------------------------------Desenha a animação de pulo na tela------------------------------------------
	if(enemy.data.runing == false and enemy.data.direction == "right"  and enemy.data.jumping == true and enemy.data.crouching == false and enemy.data.atacking == false and enemy.data.walking == false)then
		enemy.animation.jump_right:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
		--play_this_song(sound.enemy.jump_voice);
	elseif(enemy.data.runing == false and enemy.data.direction == "left" and enemy.data.jumping == true and enemy.data.crouching == false and enemy.data.atacking == false and enemy.data.walking == false)then
		enemy.animation.jump_left:draw(enemy.spritesheet,konoha.enemy.body:getX(),konoha.enemy.body:getY());
		--play_this_song(sound.enemy.jump_voice);
	end]]
	

	--Execução da animação de atacar
	--if(enemy.data.direction == "right" and enemy.data.atacking == true)then
	--	
	--elseif(enemy.data.direction == "left" and enemy.data.atacking == true)then
	--	
	--end
	--
	
	--enemy.animation.crouch_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.crouch_left:draw(enemy.spritesheet,200,200);
	--enemy.animation.jump_right:draw(enemy.spritesheet,enemy.data.x,enemy.data.y);
	--enemy.animation.jump_left:draw(enemy.spritesheet,enemy.data.x,enemy.data.y);
	--enemy.animation.jump_end_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.jump_end_left:draw(enemy.spritesheet,200,200);

	--enemy.animation.atack_jump_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.atack_jump_left:draw(enemy.spritesheet,200,200);
	--enemy.animation.damage_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.damage_left:draw(enemy.spritesheet,200,200);
	--enemy.animation.throw_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.throw_left:draw(enemy.spritesheet,200,200);
	--enemy.animation.throw_jump_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.throw_jump_left:draw(enemy.spritesheet,200,200);
	--enemy.animation.die_right:draw(enemy.spritesheet,100,100);
	--enemy.animation.die_left:draw(enemy.spritesheet,200,200);
end
--------------------------------------------------------------------------------