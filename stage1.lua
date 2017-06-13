------------Códigos necessário para execução normal deste outro código----------------
require 'interface_controller';
require 'game_controller';
require 'player_controller';
require 'physic_controller';
require 'sound_controller'
-----------------Declaração de todas variaveis referentes a fase 1--------------------
stage_1_background = love.graphics.newImage('final_valley_background.png');--Background
stage_1_background_x = 0;----------------------------------------------------Posição X do Background
stage_1_background_y = 280;--------------------------------------------------Posição Y do Background
--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-------------------------------

function stage1_load()
	stop_this_song(sound.interface.main_menu_theme);--Para o som do menu principal
end

function stage1_update(dt)

	play_this_song(sound.scenario.river);-------------Toca o som de uma cachoeira ao fundo

end

function stage1_draw()
	
	draw_this_image(stage_1_background, stage_1_background_x,stage_1_background_y,.98);--Background da cena
	animation_draw();--------------------------------------------------------------------Desenha as animações do jogador
	joystick_draw();---------------------------------------------------------------------Desenha a ultima tecla apertada
	love.graphics.setBackgroundColor(48, 110, 200);--------------------------------------Colore o fundo de azul
  
  --[[
	--------------------------------Desenha o chão na tela ------------------------------------
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_1.body:getWorldPoints(konoha.objects.stage_1.platform_1.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_2.body:getWorldPoints(konoha.objects.stage_1.platform_2.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_3.body:getWorldPoints(konoha.objects.stage_1.platform_3.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_4.body:getWorldPoints(konoha.objects.stage_1.platform_4.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_5.body:getWorldPoints(konoha.objects.stage_1.platform_5.shape:getPoints()));
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_7.body:getWorldPoints(konoha.objects.stage_1.platform_7.shape:getPoints()));  
	--------------------------------Desenha os limites do mapa-----------------------------------
	love.graphics.polygon("fill",konoha.objects.stage_1.platform_6.body:getWorldPoints(konoha.objects.stage_1.platform_6.shape:getPoints())); --Limite de baixo(player morre se tocar)
	-------------------------------Raycast do jogador-----------------------------------------
	love.graphics.polygon("fill",konoha.player.body:getWorldPoints(konoha.player.shape:getPoints()));
  -------------------------------Raycast do inimigo-----------------------------------------
  love.graphics.polygon("fill",konoha.enemy.body:getWorldPoints(konoha.enemy.shape:getPoints()));
  -----------------------------------------------------------------------------------------
  ]]

end

--------------------------------FUNÇÕES DIVERSAS DO LOVE2D------------------------------

function physics_stage_1()
	--------------------------Criação do chão da FASE 1----------------------
	konoha.objects.stage_1 = {};

	-------------------------------Plataforma 1------------------------------
  	konoha.objects.stage_1.platform_1 = {}
  	konoha.objects.stage_1.platform_1.body = love.physics.newBody(konoha.world, 55, 580-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_1.shape = love.physics.newRectangleShape(285, 10);----------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_1.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_1.body, konoha.objects.stage_1.platform_1.shape); --attach shape to body
  	konoha.objects.stage_1.platform_1.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_1.fixture:setUserData("Platform");
  	-------------------------------Plataforma 2------------------------------
  	konoha.objects.stage_1.platform_2 = {}
  	konoha.objects.stage_1.platform_2.body = love.physics.newBody(konoha.world, 312, 563-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_2.shape = love.physics.newRectangleShape(60, 10);------------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_2.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_2.body, konoha.objects.stage_1.platform_2.shape); --attach shape to body
  	konoha.objects.stage_1.platform_2.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_2.fixture:setUserData("Platform");
  	-------------------------------Plataforma 3------------------------------
  	konoha.objects.stage_1.platform_3 = {}
  	konoha.objects.stage_1.platform_3.body = love.physics.newBody(konoha.world, 430, 595-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_3.shape = love.physics.newRectangleShape(60, 10);------------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_3.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_3.body, konoha.objects.stage_1.platform_3.shape); --attach shape to body
  	konoha.objects.stage_1.platform_3.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_3.fixture:setUserData("Platform");
	-------------------------------Plataforma 4------------------------------
  	konoha.objects.stage_1.platform_4 = {}
  	konoha.objects.stage_1.platform_4.body = love.physics.newBody(konoha.world, 547, 557-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_4.shape = love.physics.newRectangleShape(60, 10);------------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_4.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_4.body, konoha.objects.stage_1.platform_4.shape); --attach shape to body
  	konoha.objects.stage_1.platform_4.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_4.fixture:setUserData("Platform");
  	-------------------------------Plataforma 5------------------------------
  	konoha.objects.stage_1.platform_5 = {}
  	konoha.objects.stage_1.platform_5.body = love.physics.newBody(konoha.world, 800, 580-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_5.shape = love.physics.newRectangleShape(300, 10);-----------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_5.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_5.body, konoha.objects.stage_1.platform_5.shape); --attach shape to body
  	konoha.objects.stage_1.platform_5.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_5.fixture:setUserData("Platform");
  	-------------------------------Limites do cenário-------------------------
  	konoha.objects.stage_1.platform_6 = {}
  	konoha.objects.stage_1.platform_6.body = love.physics.newBody(konoha.world, 400, 680-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_6.shape = love.physics.newRectangleShape(800, 10);-----------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_6.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_6.body, konoha.objects.stage_1.platform_6.shape); --attach shape to body
  	konoha.objects.stage_1.platform_6.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_6.fixture:setUserData("Platform_Limit_Down");
  	--------------------------Checkpoint do final da fase-----------------------
  	konoha.objects.stage_1.platform_7 = {}
  	konoha.objects.stage_1.platform_7.body = love.physics.newBody(konoha.world, 800, 580-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  	konoha.objects.stage_1.platform_7.shape = love.physics.newRectangleShape(300, 10);-----------Define o tamanho do objeto
  	konoha.objects.stage_1.platform_7.fixture = love.physics.newFixture(konoha.objects.stage_1.platform_7.body, konoha.objects.stage_1.platform_7.shape); --attach shape to body
  	konoha.objects.stage_1.platform_7.fixture:setFriction(player.data.friction);
  	konoha.objects.stage_1.platform_7.fixture:setUserData("Stage1_Final_Platform");

end