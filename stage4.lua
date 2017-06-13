------------Códigos necessário para execução normal deste outro código----------------
require 'interface_controller';
require 'game_controller';
require 'player_controller';
require 'physic_controller';
require 'sound_controller'
-----------------Declaração de todas variaveis referentes a fase 2----------------------
stage_4_background = love.graphics.newImage('Bridge_Stage_Stage_4.png');-------Background
stage_4_background_x = 0;-------------------------------------------------------Posição X do Background
stage_4_background_y = 330;-----------------------------------------------------Posição Y do Background
stage_4_background_scale = 1;-------------------------------------------------Escala do background

-----------------Variaveis das nuvens------------------------
cloud_background_4 = love.graphics.newImage('Bridge_Stage_Stage_4_sky.png');-------Background
cloud_4_background = love.graphics.newImage('Bridge_Stage_Stage_4_sky.png');
cloud_x = 0;
cloud_4_x = cloud_background_4:getWidth();
-----------------------------------------------------------


function stage4_load()
  konoha.player.body:setPosition(player.data.spawn.stage3_x,player.data.spawn.stage3_y);
end

function stage4_update(dt)
  ---------------------------Movimentação da camera---------------------------
  if(konoha.player.body:getX() > love.graphics.getWidth()/2)then
    camera.x = konoha.player.body:getX() - love.graphics.getWidth()/2
  end
  if(camera.x > 1080)then----------Bloqueia a camera no final da fase
    camera.x = 1080
  end
  ----------------------------------------------------------------------------
end

function stage4_draw()
  ----------Modulo da camera-----------
              camera:set(); 
  -------------------------------------
  love.graphics.setBackgroundColor(48, 110, 200);
  --draw_this_image(cloud_background_4,cloud_x,320);
  --draw_this_image(cloud_4_background,cloud_4_x,320);

	draw_this_image(stage_4_background, stage_4_background_x,stage_4_background_y,stage_4_background_scale);--Background da cena
	animation_draw();-----------------------------------------------------------------------------------------Desenha as animações do jogador
	joystick_draw();------------------------------------------------------------------------------------------Desenha a ultima tecla apertada

	--------------------------------Desenha o chão na tela ------------------------------------
	--love.graphics.polygon("fill",konoha.objects.stage_4.platform_1.body:getWorldPoints(konoha.objects.stage_4.platform_1.shape:getPoints())); 
	--love.graphics.polygon("fill",konoha.objects.stage_4.platform_2.body:getWorldPoints(konoha.objects.stage_4.platform_2.shape:getPoints())); 
	--love.graphics.polygon("fill",konoha.objects.stage_4.platform_3.body:getWorldPoints(konoha.objects.stage_4.platform_3.shape:getPoints())); 
	--love.graphics.polygon("fill",konoha.objects.stage_4.platform_4.body:getWorldPoints(konoha.objects.stage_4.platform_4.shape:getPoints())); 
	--love.graphics.polygon("fill",konoha.objects.stage_4.platform_5.body:getWorldPoints(konoha.objects.stage_4.platform_5.shape:getPoints()));
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_6.body:getWorldPoints(konoha.objects.stage_4.platform_6.shape:getPoints()));
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_7.body:getWorldPoints(konoha.objects.stage_4.platform_7.shape:getPoints()));
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_8.body:getWorldPoints(konoha.objects.stage_4.platform_8.shape:getPoints()));
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_9.body:getWorldPoints(konoha.objects.stage_4.platform_9.shape:getPoints()));
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_10.body:getWorldPoints(konoha.objects.stage_4.platform_10.shape:getPoints()));
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_11.body:getWorldPoints(konoha.objects.stage_4.platform_11.shape:getPoints()));    
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_12.body:getWorldPoints(konoha.objects.stage_4.platform_12.shape:getPoints()));    
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_13.body:getWorldPoints(konoha.objects.stage_4.platform_13.shape:getPoints()));    
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_11.body:getWorldPoints(konoha.objects.stage_4.platform_11.shape:getPoints()));    
  --love.graphics.polygon("fill",konoha.objects.stage_4.platform_12.body:getWorldPoints(konoha.objects.stage_4.platform_12.shape:getPoints()));    
  
	--------------------------------Desenha os limites do mapa-----------------------------------
	--love.graphics.polygon("fill",konoha.objects.stage_4.platform_6.body:getWorldPoints(konoha.objects.stage_4.platform_6.shape:getPoints())); --Limite de baixo(player morre se tocar)
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
  ----------Modulo da camera-----------
            camera:unset();
  ------------------------------------- 
end

function physics_stage_4()
  

	---------------------------------Criação do chão da FASE 2----------------------------------
	konoha.objects.stage_4 = {};
	-------------------------------Plataforma 1------------------------------FEITa
  konoha.objects.stage_4.platform_1 = {}
  konoha.objects.stage_4.platform_1.body = love.physics.newBody(konoha.world, 300, 520-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_1.shape = love.physics.newRectangleShape(1000, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_1.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_1.body, konoha.objects.stage_4.platform_1.shape); --attach shape to body
  konoha.objects.stage_4.platform_1.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_1.fixture:setUserData("Platform");
  ---------------------------------Plataforma 2------------------------------Feita
  konoha.objects.stage_4.platform_2 = {}
  konoha.objects.stage_4.platform_2.body = love.physics.newBody(konoha.world, 750, 500-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_2.shape = love.physics.newRectangleShape(120, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_2.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_2.body, konoha.objects.stage_4.platform_2.shape); --attach shape to body
  konoha.objects.stage_4.platform_2.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_2.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_2.body:setAngle(math.rad(335));
  ---------------------------------Plataforma 3------------------------------Feita
  konoha.objects.stage_4.platform_3 = {}
  konoha.objects.stage_4.platform_3.body = love.physics.newBody(konoha.world, 915, 540-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_3.shape = love.physics.newRectangleShape(110, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_3.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_3.body, konoha.objects.stage_4.platform_3.shape); --attach shape to body
  konoha.objects.stage_4.platform_3.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_3.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_3.body:setAngle(math.rad(335));
  ---------------------------------Plataforma 4------------------------------Feita
  konoha.objects.stage_4.platform_4 = {}
  konoha.objects.stage_4.platform_4.body = love.physics.newBody(konoha.world, 810, 615-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_4.shape = love.physics.newRectangleShape(230, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_4.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_4.body, konoha.objects.stage_4.platform_4.shape); --attach shape to body
  konoha.objects.stage_4.platform_4.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_4.fixture:setUserData("Platform");
  ---------------------------------Plataforma 5------------------------------Feita
  konoha.objects.stage_4.platform_5 = {}
  konoha.objects.stage_4.platform_5.body = love.physics.newBody(konoha.world, 870, 668-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_5.shape = love.physics.newRectangleShape(230, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_5.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_5.body, konoha.objects.stage_4.platform_5.shape); --attach shape to body
  konoha.objects.stage_4.platform_5.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_5.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_5.body:setAngle(math.rad(90));
  -------------------------------Plataforma 6------------------------------FEITa
  konoha.objects.stage_4.platform_6 = {}
  konoha.objects.stage_4.platform_6.body = love.physics.newBody(konoha.world, 1190, 520-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_6.shape = love.physics.newRectangleShape(460, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_6.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_6.body, konoha.objects.stage_4.platform_6.shape); --attach shape to body
  konoha.objects.stage_4.platform_6.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_6.fixture:setUserData("Platform");
  ---------------------------------Plataforma 7------------------------------Feita
  konoha.objects.stage_4.platform_7 = {}
  konoha.objects.stage_4.platform_7.body = love.physics.newBody(konoha.world, 1450, 535-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_7.shape = love.physics.newRectangleShape(67, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_7.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_7.body, konoha.objects.stage_4.platform_7.shape); --attach shape to body
  konoha.objects.stage_4.platform_7.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_7.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_7.body:setAngle(math.rad(25));
  ---------------------------------Plataforma 8------------------------------Feita
  konoha.objects.stage_4.platform_8 = {}
  konoha.objects.stage_4.platform_8.body = love.physics.newBody(konoha.world, 1535, 615-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_8.shape = love.physics.newRectangleShape(300, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_8.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_8.body, konoha.objects.stage_4.platform_8.shape); --attach shape to body
  konoha.objects.stage_4.platform_8.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_8.fixture:setUserData("Platform");
  ---------------------------------Plataforma 9------------------------------Feita
  konoha.objects.stage_4.platform_9 = {}
  konoha.objects.stage_4.platform_9.body = love.physics.newBody(konoha.world, 1565, 515-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_9.shape = love.physics.newRectangleShape(60, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_9.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_9.body, konoha.objects.stage_4.platform_9.shape); --attach shape to body
  konoha.objects.stage_4.platform_9.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_9.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_9.body:setAngle(math.rad(335));
  ---------------------------------Plataforma 10------------------------------Feita
  konoha.objects.stage_4.platform_10 = {}
  konoha.objects.stage_4.platform_10.body = love.physics.newBody(konoha.world, 1615, 515-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_10.shape = love.physics.newRectangleShape(60, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_10.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_10.body, konoha.objects.stage_4.platform_10.shape); --attach shape to body
  konoha.objects.stage_4.platform_10.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_10.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_10.body:setAngle(math.rad(25));
  ---------------------------------Plataforma 11------------------------------Feita
  konoha.objects.stage_4.platform_11 = {}
  konoha.objects.stage_4.platform_11.body = love.physics.newBody(konoha.world, 1780, 520-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_11.shape = love.physics.newRectangleShape(300, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_11.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_11.body, konoha.objects.stage_4.platform_11.shape); --attach shape to body
  konoha.objects.stage_4.platform_11.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_11.fixture:setUserData("Stage1_Final_Platform");
    ---------------------------------Plataforma 12------------------------------Feita
  konoha.objects.stage_4.platform_12 = {}
  konoha.objects.stage_4.platform_12.body = love.physics.newBody(konoha.world, 1540, 648-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_12.shape = love.physics.newRectangleShape(230, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_12.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_12.body, konoha.objects.stage_4.platform_12.shape); --attach shape to body
  konoha.objects.stage_4.platform_12.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_12.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_12.body:setAngle(math.rad(90));
  ---------------------------------Plataforma 13------------------------------Feita
  konoha.objects.stage_4.platform_13 = {}
  konoha.objects.stage_4.platform_13.body = love.physics.newBody(konoha.world, 1480, 660-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_13.shape = love.physics.newRectangleShape(230, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_13.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_13.body, konoha.objects.stage_4.platform_13.shape); --attach shape to body
  konoha.objects.stage_4.platform_13.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_13.fixture:setUserData("Platform");
  konoha.objects.stage_4.platform_13.body:setAngle(math.rad(90));
 --[[
  -------------------------------Limites do cenário-------------------------
  konoha.objects.stage_4.platform_6 = {}
  konoha.objects.stage_4.platform_6.body = love.physics.newBody(konoha.world, 300, 600-50/2);--Seleciona o mundo, e a posição X e Y do corpo
  konoha.objects.stage_4.platform_6.shape = love.physics.newRectangleShape(1000, 10); --make a rectangle with a width of 650 and a height of 50
  konoha.objects.stage_4.platform_6.fixture = love.physics.newFixture(konoha.objects.stage_4.platform_6.body, konoha.objects.stage_4.platform_6.shape); --attach shape to body
  konoha.objects.stage_4.platform_6.fixture:setFriction(player.data.friction);
  konoha.objects.stage_4.platform_6.fixture:setUserData("Platform_Limit_Down");
  --------------------------------------------------------------------------]]
end