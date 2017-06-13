------------Códigos necessário para execução normal deste outro código----------------
require 'interface_controller';
require 'game_controller';
require 'player_controller';
require 'physic_controller';
require 'sound_controller'
-----------------Declaração de todas variaveis referentes a fase 2----------------------
stage_3_background = love.graphics.newImage('stage_2_background.png');-------Background
stage_3_background_x = 0;----------------------------------------------------Posição X do Background
stage_3_background_y = 242;--------------------------------------------------Posição Y do Background
stage_3_background_scale = .85;------------------------------------------------Escala do background

-----------------Variaveis das nuvens------------------------
cloud_background = love.graphics.newImage('cloud_stage_2.jpg');-------Background
cloud_2_background = love.graphics.newImage('cloud_stage_2.jpg');
cloud_x = 0;
cloud_2_x = cloud_background:getWidth();
-----------------------------------------------------------


function stage3_load()
  konoha.player.body:setPosition(player.data.spawn.stage3_x,player.data.spawn.stage3_y);
end

function stage3_update(dt)
  --------------Movimentação das nuvens---------------
  cloud_x = cloud_x - 1;
  cloud_2_x = cloud_2_x - 1;
  if(cloud_x + cloud_background:getWidth() < 0)then
    cloud_x = cloud_2_x + cloud_2_background:getWidth();
  end
  if(cloud_2_x + cloud_2_background:getWidth() < 0)then
    cloud_2_x = cloud_x + cloud_background:getWidth();
  end
  ----------------------------------------------------
end

function stage3_draw()

  draw_this_image(cloud_background,cloud_x,0);
  draw_this_image(cloud_2_background,cloud_2_x,0);

	draw_this_image(stage_3_background, stage_3_background_x,stage_3_background_y,stage_3_background_scale);--Background da cena
	animation_draw();--------------------------------------------------------------Desenha as animações do jogador
	joystick_draw();---------------------------------------------------------------------Desenha a ultima tecla apertada
	love.graphics.setBackgroundColor(48, 110, 200);--------------------------------------Colore o fundo de azul
  love.graphics.setColor(25, 70, 112);-------------------------------------------------Deixa a fase a noite
--[[
	--------------------------------Desenha o chão na tela ------------------------------------
	love.graphics.polygon("fill",konoha.objects.stage_3.platform_1.body:getWorldPoints(konoha.objects.stage_3.platform_1.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_3.platform_2.body:getWorldPoints(konoha.objects.stage_3.platform_2.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_3.platform_3.body:getWorldPoints(konoha.objects.stage_3.platform_3.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_3.platform_4.body:getWorldPoints(konoha.objects.stage_3.platform_4.shape:getPoints())); 
	love.graphics.polygon("fill",konoha.objects.stage_3.platform_5.body:getWorldPoints(konoha.objects.stage_3.platform_5.shape:getPoints()));
  love.graphics.polygon("fill",konoha.objects.stage_3.platform_8.body:getWorldPoints(konoha.objects.stage_3.platform_8.shape:getPoints()));
  love.graphics.polygon("fill",konoha.objects.stage_3.platform_9.body:getWorldPoints(konoha.objects.stage_3.platform_9.shape:getPoints()));    
  love.graphics.polygon("fill",konoha.objects.stage_3.platform_10.body:getWorldPoints(konoha.objects.stage_3.platform_10.shape:getPoints()));    
  love.graphics.polygon("fill",konoha.objects.stage_3.platform_11.body:getWorldPoints(konoha.objects.stage_3.platform_11.shape:getPoints()));    
  love.graphics.polygon("fill",konoha.objects.stage_3.platform_12.body:getWorldPoints(konoha.objects.stage_3.platform_12.shape:getPoints()));    
  
	--------------------------------Desenha os limites do mapa-----------------------------------
	--love.graphics.polygon("fill",konoha.objects.stage_3.platform_6.body:getWorldPoints(konoha.objects.stage_3.platform_6.shape:getPoints())); --Limite de baixo(player morre se tocar)
	-------------------------------Raycast do jogador-----------------------------------------]]
  --love.graphics.polygon("fill",konoha.player.body:getWorldPoints(konoha.player.shape:getPoints()));
	------------------------------------------------------------------------------------------
  
  
  --love.graphics.print("life "..tostring(player.data.life),10,10) 
  --love.graphics.print("walking "..tostring(player.data.walking),10,30) 
  --love.graphics.print("jumping "..tostring(player.data.jumping),10,50) 
  --love.graphics.print("is landed "..tostring(player.data.is_landed),10,70) 
 
  -------------------------------Raycast do inimigo-----------------------------------------
  --love.graphics.polygon("fill",konoha.enemy.body:getWorldPoints(konoha.enemy.shape:getPoints()));
  ----------------------------------------------------------------------------------------
end

function physics_stage_3()

	-------------------------------Criação do chão da FASE 2----------------------------------
	konoha.objects.stage_3 = {};
	-------------------------------Plataforma 1------------------------------FEITa
  konoha.objects.stage_3.platform_1 = {}
  konoha.objects.stage_3.platform_1.body = love.physics.newBody(konoha.world, 640, 550-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_1.shape = love.physics.newRectangleShape(1100, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_1.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_1.body, konoha.objects.stage_3.platform_1.shape); --attach shape to body
  konoha.objects.stage_3.platform_1.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_1.fixture:setUserData("Platform");
  -------------------------------Plataforma 2------------------------------Feita
  konoha.objects.stage_3.platform_2 = {}
  konoha.objects.stage_3.platform_2.body = love.physics.newBody(konoha.world, 120, 460-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_2.shape = love.physics.newRectangleShape(240, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_2.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_2.body, konoha.objects.stage_3.platform_2.shape); --attach shape to body
  konoha.objects.stage_3.platform_2.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_2.fixture:setUserData("Platform");
  -------------------------------Plataforma 3------------------------------feita
  konoha.objects.stage_3.platform_3 = {}
  konoha.objects.stage_3.platform_3.body = love.physics.newBody(konoha.world, 235, 507-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_3.shape = love.physics.newRectangleShape(10, 80); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_3.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_3.body, konoha.objects.stage_3.platform_3.shape); --attach shape to body
  konoha.objects.stage_3.platform_3.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_3.fixture:setUserData("Wall");
  -------------------------------Plataforma 12------------------------------
  konoha.objects.stage_3.platform_12 = {}
  konoha.objects.stage_3.platform_12.body = love.physics.newBody(konoha.world, 650, 480-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_12.shape = love.physics.newRectangleShape(10, 100); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_12.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_12.body, konoha.objects.stage_3.platform_12.shape); --attach shape to body
  konoha.objects.stage_3.platform_12.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_12.fixture:setUserData("Wall");
	------------------------------Plataforma 4------------------------------feita
  konoha.objects.stage_3.platform_4 = {}
  konoha.objects.stage_3.platform_4.body = love.physics.newBody(konoha.world, 432, 400-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_4.shape = love.physics.newRectangleShape(270, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_4.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_4.body, konoha.objects.stage_3.platform_4.shape); --attach shape to body
  konoha.objects.stage_3.platform_4.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_4.fixture:setUserData("Platform");
  ------------------------------Plataforma 10------------------------------feita
  konoha.objects.stage_3.platform_10 = {}
  konoha.objects.stage_3.platform_10.body = love.physics.newBody(konoha.world, 417, 328-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_10.shape = love.physics.newRectangleShape(135, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_10.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_10.body, konoha.objects.stage_3.platform_10.shape); --attach shape to body
  konoha.objects.stage_3.platform_10.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_10.fixture:setUserData("Platform");
  -------------------------------Plataforma 5------------------------------feita
  konoha.objects.stage_3.platform_5 = {}
  konoha.objects.stage_3.platform_5.body = love.physics.newBody(konoha.world, 800, 580-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_5.shape = love.physics.newRectangleShape(300, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_5.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_5.body, konoha.objects.stage_3.platform_5.shape); --attach shape to body
  konoha.objects.stage_3.platform_5.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_5.fixture:setUserData("Platform");
  --------------------------Plataforma 9-----------------------feita
  konoha.objects.stage_3.platform_9 = {}
  konoha.objects.stage_3.platform_9.body = love.physics.newBody(konoha.world, 745, 375-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_9.shape = love.physics.newRectangleShape(110, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_9.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_9.body, konoha.objects.stage_3.platform_9.shape); --attach shape to body
  konoha.objects.stage_3.platform_9.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_9.fixture:setUserData("Platform");
  --------------------------Plataforma 11-----------------------feita
  konoha.objects.stage_3.platform_11 = {}
  konoha.objects.stage_3.platform_11.body = love.physics.newBody(konoha.world, 700, 425-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_11.shape = love.physics.newRectangleShape(110, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_11.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_11.body, konoha.objects.stage_3.platform_11.shape); --attach shape to body
  konoha.objects.stage_3.platform_11.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_11.fixture:setUserData("Platform");
  --------------------------Checkpoint do final da fase-----------------------feita
  konoha.objects.stage_3.platform_8 = {}
  konoha.objects.stage_3.platform_8.body = love.physics.newBody(konoha.world, 745, 375-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_8.shape = love.physics.newRectangleShape(65, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_8.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_8.body, konoha.objects.stage_3.platform_8.shape); --attach shape to body
  konoha.objects.stage_3.platform_8.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_8.fixture:setUserData("Stage1_Final_Platform");
  -------------------------------Limites do cenário-------------------------
  konoha.objects.stage_3.platform_6 = {}
  konoha.objects.stage_3.platform_6.body = love.physics.newBody(konoha.world, 300, 600-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_3.platform_6.shape = love.physics.newRectangleShape(1000, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_3.platform_6.fixture = love.physics.newFixture(konoha.objects.stage_3.platform_6.body, konoha.objects.stage_3.platform_6.shape); --attach shape to body
  konoha.objects.stage_3.platform_6.fixture:setFriction(player.data.friction);
  konoha.objects.stage_3.platform_6.fixture:setUserData("Platform_Limit_Down");
  --------------------------------------------------------------------------
end