------------Códigos necessário para execução normal deste outro código-----------------
anim8 = require 'anim8'; 

-----------Declaração de todas variaveis referentes ao jogador principal---------------
player = {};
--------------------------Todas informações sobre o jogador----------------
player.data = {};
player.data.x = 25;--Posição X do jogador (Canto esquerdo superior da imagem)
player.data.y = 25;--Posição Y do jogador (Canto esquerdo superior da imagem)
player.data.w = 40;--Largura do jogador (Canto direito inferior da imagem)
player.data.h = 50;--Altura do jogador (Canto direito inferior da imagem)
player.data.life = 150;--Vida do jogador MAX: 150
player.data.speed = 50;--Velocidade do jogador andando
player.data.run_speed = 100;--Velocidade do jogador correndo
player.data.jump_force = 150;--Força do pulo do jogador
player.data.gravity = 3;--Gravidade aplicada sobre o jogador (Essa variavel ficará absoleta no proximo update)
player.data.density = 1;--Densidade do jogador
player.data.friction = 1.0;--Fricição do jogador no mundo físico
player.data.is_landed = false;--Status: Tocando o chão
player.data.idle = true;--Status: Parado
player.data.walking = false;--Status: Andando
player.data.runing = false;--Status: Correndo
player.data.jumping = false;--Status: Pulando
player.data.crouching = false;--Status: Agachando
player.data.atacking = false;--Status: Atacando
player.data.taking_damage = false;
player.data.is_using_jutsu = false;--Status: Usando um Jutsu
---------------------------Todas posições iniciais----------------------
player.data.spawn = {};
player.data.spawn.stage1_x = 500;
player.data.spawn.stage1_y = 0;

player.data.spawn.stage2_x = 10;
player.data.spawn.stage2_y = 380;

player.data.spawn.stage3_x = 10;
player.data.spawn.stage3_y = 380;

player.data.spawn.stage4_x = 10;
player.data.spawn.stage4_y = 800;
-----------------Para onde o jogador está olhando-----------------------
player.data.direction = "right";--Para qual lado o jogador está olhando("left" = esquerda, "right" = direita)
----------------------------Todos os jutsus do jogador-----------------------
player.jutsus = {}
player.jutsus.rasengan = {};--Todas informações referents ao jutsu do Rasengan
player.jutsus.rasengan.description = "O Rasengan é uma técnica poderosa de classificação A inventada pelo Quarto Hokage, que a criou observando a formação da Bola da Besta com Cauda. É a manipulação de chakra puro, em forma de uma esfera espiral de chakra.";
player.jutsus.rasengan.damage = 200;--Valor do dano causado no inimigo pelo rasengan
player.jutsus.rasengan.bought = false;--Variavel responsavel por dizer se o jogador já comprou ou não esse jutsu

------------------------Sprites Sheet do jogador------------------------
player.spritesheet = love.graphics.newImage("naruto_sheet.png");
------------------------------------------------------------------------
--------------------------Declaração de todos os grids do jogador----------------------
----PARAMETROS:Largura e altura da animação, largura e altura da imagem,pontos X e Y onde a imagem da animação começa(Origem)
player.grid = {};
player.grid.idle = anim8.newGrid(49,52,player.spritesheet:getWidth(),player.spritesheet:getHeight(),9,20);
player.grid.walk = anim8.newGrid(40,53,player.spritesheet:getWidth(),player.spritesheet:getHeight(),240,21);
player.grid.run = anim8.newGrid(59,50,player.spritesheet:getWidth(),player.spritesheet:getHeight(),1,240);
player.grid.crouch = anim8.newGrid(53,48,player.spritesheet:getWidth(),player.spritesheet:getHeight(),9,384);
player.grid.jump = anim8.newGrid(50,52,player.spritesheet:getWidth(),player.spritesheet:getHeight(),7,308);
player.grid.jump_end = anim8.newGrid(75,59,player.spritesheet:getWidth(),player.spritesheet:getHeight(),214,309);
player.grid.atack = anim8.newGrid(62,58,player.spritesheet:getWidth(),player.spritesheet:getHeight(),5,451);
player.grid.atack_jump = anim8.newGrid(60,61,player.spritesheet:getWidth(),player.spritesheet:getHeight(),262,522);
player.grid.damage = anim8.newGrid(50,54,player.spritesheet:getWidth(),player.spritesheet:getHeight(),14,1956);
player.grid.throw = anim8.newGrid(65,53,player.spritesheet:getWidth(),player.spritesheet:getHeight(),0,863);
player.grid.throw_jump = anim8.newGrid(53,59,player.spritesheet:getWidth(),player.spritesheet:getHeight(),442,856);
player.grid.die = anim8.newGrid(64,36,player.spritesheet:getWidth(),player.spritesheet:getHeight(),260,2029);

------------------------Declaração de todas animações do jogador------------------------
----PARAMETROS: Grid,Colunas da animação no sprite, linha, velocidade de execução-------
player.animation = {};
player.animation.idle_right = anim8.newAnimation(player.grid.idle('1-4',1),0.12);
player.animation.idle_left = anim8.newAnimation(player.grid.idle('1-4',1),0.12):flipH();
player.animation.walk_right = anim8.newAnimation(player.grid.walk('1-6',1),0.1);
player.animation.walk_left = anim8.newAnimation(player.grid.walk('1-6',1),0.1):flipH();
player.animation.run_right = anim8.newAnimation(player.grid.run('1-6',1),0.1);
player.animation.run_left = anim8.newAnimation(player.grid.run('1-6',1),0.1):flipH();
player.animation.crouch_right = anim8.newAnimation(player.grid.crouch('1-4',1),0.1);
player.animation.crouch_left = anim8.newAnimation(player.grid.crouch('1-4',1),0.1):flipH();
player.animation.jump_right = anim8.newAnimation(player.grid.jump('1-2',1),0.8);
player.animation.jump_left = anim8.newAnimation(player.grid.jump('1-2',1),0.8):flipH();
player.animation.jump_end_right = anim8.newAnimation(player.grid.jump_end('1-6',1),0.1);
player.animation.jump_end_left = anim8.newAnimation(player.grid.jump_end('1-6',1),0.1):flipH();
player.animation.atack_right = anim8.newAnimation(player.grid.atack('1-1',1),0.1,end_atack);--Pra fazer combo terá que mudar a string da coluna em tempo real
player.animation.atack_left = anim8.newAnimation(player.grid.atack('1-1',1),0.1,end_atack):flipH();--Pra fazer combo terá que mudar a string da coluna em tempo real
player.animation.atack_jump_right = anim8.newAnimation(player.grid.atack_jump('1-3',1),0.12);
player.animation.atack_jump_left = anim8.newAnimation(player.grid.atack_jump('1-3',1),0.12):flipH();
player.animation.damage_right = anim8.newAnimation(player.grid.damage('1-1',1),0.1);
player.animation.damage_left = anim8.newAnimation(player.grid.damage('1-1',1),0.1):flipH();
player.animation.throw_right = anim8.newAnimation(player.grid.throw('1-3',1),0.12);
player.animation.throw_left = anim8.newAnimation(player.grid.throw('1-3',1),0.12):flipH();
player.animation.throw_jump_right = anim8.newAnimation(player.grid.throw_jump('1-3',1),0.12);
player.animation.throw_jump_left = anim8.newAnimation(player.grid.throw_jump('1-3',1),0.12):flipH();
player.animation.die_right = anim8.newAnimation(player.grid.die('1-2',1),0.12,'pauseAtEnd'):flipH();
player.animation.die_left = anim8.newAnimation(player.grid.die('1-2',1),0.12,'pauseAtEnd');


--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-------------------------------
function animation_load()

end

function animation_update(dt)
	-----------Função resposavel por controlar os estados do jogador---------------------
	--player_state_controller();--!!FUNÇÃO BUGADA!! NÃO REATIVE
	------------------------Animações do personagem sendo carregadas----------------------
	-----------------------------------Parado---------------------------------------------
	player.animation.idle_right:update(dt);--------Atualiza a animação virada para direita
	player.animation.idle_left:update(dt);---------Atualiza a animação virada para esquerda

	----------------------------------Andando---------------------------------------------
	player.animation.walk_right:update(dt);--------Atualiza a animação virada para direita
	player.animation.walk_left:update(dt);---------Atualiza a animação virada para esquerda

	----------------------------------Atacando--------------------------------------------
	player.animation.atack_right:update(dt);-------Atualiza a animação virada para direita
	player.animation.atack_left:update(dt);--------Atualiza a animação virada para esquerda

	----------------------------------Correndo--------------------------------------------
	player.animation.run_right:update(dt);---------Atualiza a animação virada para direita
	player.animation.run_left:update(dt);----------Atualiza a animação virada para esquerda

	----------------------------------Agachando-------------------------------------------
	player.animation.crouch_right:update(dt);------Atualiza a animação virada para direita
	player.animation.crouch_left:update(dt);-------Atualiza a animação virada para esquerda

	----------------------------------Pulando---------------------------------------------
	player.animation.jump_right:update(dt);--------Atualiza a animação virada para direita
	player.animation.jump_left:update(dt);---------Atualiza a animação virada para esquerda

	----------------------------Tocando o chão pós pulo-----------------------------------
	player.animation.jump_end_right:update(dt);----Atualiza a animação virada para direita
	player.animation.jump_end_left:update(dt);-----Atualiza a animação virada para esquerda

	------------------------------Ataque pulando------------------------------------------
	player.animation.atack_jump_right:update(dt);--Atualiza a animação virada para direita
	player.animation.atack_jump_left:update(dt);---Atualiza a animação virada para esquerda

	-------------------------------Tomando dano-------------------------------------------
	player.animation.damage_right:update(dt);------Atualiza a animação virada para direita
	player.animation.damage_left:update(dt);-------Atualiza a animação virada para esquerda

	-----------------------------Arremessando algo----------------------------------------
	player.animation.throw_right:update(dt);-------Atualiza a animação virada para direita
	player.animation.throw_left:update(dt);--------Atualiza a animação virada para esquerda

	-----------------------Arremessando algo enquanto pula--------------------------------
	player.animation.throw_jump_right:update(dt);--Atualiza a animação virada para direita
	player.animation.throw_jump_left:update(dt);---Atualiza a animação virada para esquerda

	----------------------------------Morrendo--------------------------------------------
	player.animation.die_right:update(dt);---------Atualiza a animação virada para direita
	player.animation.die_left:update(dt);----------Atualiza a animação virada para esquerda
	--------------------------------------------------------------------------------------
end

function animation_draw()
	-------------------Desenha a barra de vida do jogador--------------------
	love.graphics.setColor(169,21,1);
	love.graphics.rectangle("fill", camera.x + 55, 66, player.data.life, 23)
	love.graphics.setColor(255,255,255);-----------------------Normaliza as cores
	love.graphics.draw(interface.hud, camera.x,0,math.rad(5),0.5);
	if(game_state == "stage3")then love.graphics.setColor(25, 70, 112); end ----Gambiarra de ultima hora devido a entrega do trabalho
	-------------------------------------------------------------------------

	----------------------------------Desenha a animação de idle na tela------------------------------------------
	if(player.data.idle and player.data.direction == "right" and not player.data.walking and not player.data.taking_damage and not player.data.atacking)then
		player.animation.idle_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	elseif(player.data.idle and player.data.direction == "left" and not player.data.walking and not player.data.taking_damage and not player.data.atacking)then
		player.animation.idle_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	end
	---------------------------------Desenha a animação de andar na tela------------------------------------------
	if(player.data.walking and player.data.direction == "right" and player.data.is_landed and not player.data.jumping and not player.data.crouching and not player.data.atacking and not player.data.taking_damage)then
		player.animation.walk_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	elseif(player.data.walking and player.data.direction == "left" and player.data.is_landed and not player.data.jumping and not player.data.crouching and not player.data.atacking and not player.data.taking_damage)then
		player.animation.walk_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	end
	---------------------------------Desenha a animação de correr na tela------------------------------------------
	if(player.data.runing and player.data.direction == "right" and player.data.is_landed and not player.data.jumping and not player.data.crouching and not player.data.atacking and not player.data.walking and not player.data.taking_damage)then
		player.animation.run_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY()+10);
		play_this_song(sound.player.runing);
	elseif(player.data.runing and player.data.direction == "left" and player.data.is_landed and not player.data.jumping and not player.data.crouching and not player.data.atacking and not player.data.walking and not player.data.taking_damage)then
		player.animation.run_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY()+10);
		play_this_song(sound.player.runing);
	end
	---------------------------------Desenha a animação de pulo na tela------------------------------------------
	if(not player.data.runing and player.data.direction == "right"  and player.data.jumping and not player.data.crouching and not player.data.atacking and not player.data.walking and not player.data.taking_damage)then
		player.animation.jump_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
		--play_this_song(sound.player.jump_voice);
	elseif(not player.data.runing and player.data.direction == "left"  and player.data.jumping and not player.data.crouching and not player.data.atacking and not player.data.walking and not player.data.taking_damage)then
		player.animation.jump_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
		--play_this_song(sound.player.jump_voice);
	end
	-----------------------------------Desenha a animação de tomar dano------------------------------------------
	if(player.data.direction == "right" and player.data.taking_damage)then
		player.animation.damage_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
		--play_this_song(sound.player.jump_voice);
	elseif(player.data.direction == "left" and player.data.taking_damage)then
		player.animation.damage_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
		--play_this_song(sound.player.jump_voice);
	end
	---------------------------------Desenha a animação de atacar------------------------------------------
	if(player.data.direction == "right" and player.data.atacking and player.data.is_landed and not player.data.jumping and not player.data.taking_damage and not player.data.walking and not player.data.crouching and not player.data.runing)then
		player.animation.atack_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	elseif(player.data.direction == "left" and player.data.atacking and player.data.is_landed and not player.data.jumping and not player.data.taking_damage and not player.data.walking and not player.data.crouching and not player.data.runing)then
		player.animation.atack_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	end
	-------------------------------------------------------------------------------------------------------
	
	--player.animation.crouch_right:draw(player.spritesheet,100,100);
	--player.animation.crouch_left:draw(player.spritesheet,200,200);
	--player.animation.jump_right:draw(player.spritesheet,player.data.x,player.data.y);
	--player.animation.jump_left:draw(player.spritesheet,player.data.x,player.data.y);
	--player.animation.jump_end_right:draw(player.spritesheet,100,100);
	--player.animation.jump_end_left:draw(player.spritesheet,200,200);

	--player.animation.atack_jump_right:draw(player.spritesheet,100,100);
	--player.animation.atack_jump_left:draw(player.spritesheet,200,200);
	--
	--
	--player.animation.throw_right:draw(player.spritesheet,100,100);
	--player.animation.throw_left:draw(player.spritesheet,200,200);
	--player.animation.throw_jump_right:draw(player.spritesheet,100,100);
	--player.animation.throw_jump_left:draw(player.spritesheet,200,200);
	--player.animation.die_right:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	--player.animation.die_left:draw(player.spritesheet,konoha.player.body:getX(),konoha.player.body:getY());
	
	--
	
end
---------------------------------------------------------------------------------


----------------------------FUNÇÕES DIVERSAS DO LOVE2D---------------------------

---------FUNÇÃO COM DEFEITO, NÃO ESQUECE MARCOS, NÃO USE-A, JOVEM PADAWAN!---------

---------Função responsavel por controlar e manipular os status do jogador---------

--Essa função (deveria) facilitar meus 'if" no player controller mudando os status automáticamente
--Só bastando eu mudar um deles para os outros mudarem. Porém...

function player_state_controller()
	------------Caso o player perca toda a vida------------
	if(player.data.life <= 0)then
		--Não tenho a função ainda pra chamar aqui caso ele morra.
	end
	------------Caso o player esteja parado-----------------
	if(player.data.idle == true)then------Caso o jogador esteja parado:
		player.data.is_landed = true;--------Ele deve estar no chão
		player.data.walking = false;---------Ele não está andando
		player.data.runing = false;----------Ele não está correndo
		player.data.jumping = false;---------Ele não está pulando
		player.data.crouching = false;-------Ele não está agachando
		player.data.atacking = false;--------Ele não está atacando
		player.data.is_using_jutsu = false;--Ele não está usando um jutsu
	end
	------------Caso o player esteja andando----------------
	if(player.data.walking == true)then
		player.data.is_landed = true;--------Ele deve estar no chão
		player.data.idle = false;------------Ele não está parado
		player.data.runing = false;----------Ele não está correndo
		player.data.jumping = false;---------Ele não está pulando
		player.data.crouching = false;-------Ele não está agachando
		player.data.atacking = false;--------Ele não está atacando
		player.data.is_using_jutsu = false;--Ele não está usando um jutsu
	end
	------------Caso o player esteja correndo---------------
	if(player.data.runing == true)then
		player.data.is_landed = true;--------Ele deve estar no chão
		player.data.walking = false;---------Ele não está andando
		player.data.idle = false;------------Ele não está parado
		player.data.jumping = false;---------Ele não está pulando
		player.data.crouching = false;-------Ele não está agachando
		player.data.atacking = false;--------Ele não está atacando
		player.data.is_using_jutsu = false;--Ele não está usando um jutsu
	end
	------------Caso o player esteja pulando----------------
	if(player.data.jumping == true)then
		player.data.is_landed = false;-------Ele não está no chão
		player.data.walking = false;---------Ele não está andando
		player.data.idle = false;------------Ele não está parado
		player.data.runing = false;----------Ele não está correndo
		player.data.crouching = false;-------Ele não está agachando
		player.data.atacking = false;--------Ele não está atacando
		player.data.is_using_jutsu = false;--Ele não está usando um jutsu
	end
	------------Caso o player esteja agachando--------------
	if(player.data.crouching == true)then
		player.data.is_landed = true;--------Ele deve estar no chão
		player.data.walking = false;---------Ele não está andando
		player.data.idle = false;------------Ele não está parado
		player.data.runing = false;----------Ele não está correndo
		player.data.atacking = false;--------Ele não está atacando
		player.data.is_using_jutsu = false;--Ele não está usando um jutsu
	end
end
----------------------------------------------------------------------

