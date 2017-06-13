------------Códigos necessário para execução normal deste outro código---------
require 'game_controller';
require 'sound_controller';
-------------------------------------------------------------------------------
-------------Declaração de todas variaveis referentes a interface-------------
interface = {};
interface.ui = {};
interface.ui.paper_roll = love.graphics.newImage('paper_roll.png');
interface.ui.font_size = 45;
interface.ui.canvas = love.graphics.newImage('UI_Menu_canvas.png');
interface.ui.main_menu_button_start = love.graphics.newImage('button_start.png');
interface.ui.main_menu_button_back = love.graphics.newImage('button_back.png');
interface.ui.logo = love.graphics.newImage('logo.png');

interface.hud = love.graphics.newImage('naruto_hud.png');

buttons_main_menu = {};
font_medium = love.graphics.newFont("njnaruto.ttf",interface.ui.font_size);
------------------------------------------------------------------------------

--Essa função desenha a imagem pedida
function draw_this_image(image,x,y,scale)
	love.graphics.draw(image, x,y,0,scale);
end