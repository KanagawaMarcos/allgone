------------Códigos necessário para execução normal deste outro código----------------
require 'main_menu';
require 'stage1'
require 'stage2'
require 'stage3'
require 'stage4'
-----------------------------------Controladores--------------------------------------
require 'interface_controller';
require 'game_controller';
require 'player_controller';
require 'enemy_controller';
require 'enemy_ai'
-------------------------------------Configurações------------------------------------
require 'keyboard_settings';
require 'joystick_settings';
--------------------------------------------------------------------------------------

--------------------------------FUNÇÕES BÁSICAS DO LOVE2D-----------------------------
function love.load ()
	----------Carrega e configura o mundo e o jogador-----------
						physics_load();
	------------------------------------------------------------
end

function love.update(dt)
	if(game_state == "main_menu")then
		main_menu_buttons();---------Verifica se algum botão foi apertado pelo jogador
		update_main_menu(dt);--------Toca o som do menu e ativa o efeito de piscar os botões na tela
	end
	if(game_state == "stage1")then
		stage1_load();---------------Desativa coisas referentes ao menu principal
		physics_stage_1();-----------Cria as plataformas da fase 1
		game_controller_update(dt);--Guarda o tempo levado para terminar a fase
		physics_update(dt);----------Atualiza o mundo físico a cada frame
		stage1_update(dt);-----------Toca o som de rio ao fundo 
		joystick_update(dt);---------Ativa e controla os comandos do controle
		animation_update(dt);--------Ativa animações do jogador e controla os seus estados
	end
	if(game_state == "stage2")then
		physics_stage_2();-----------Cria a física da fase 2
		game_controller_update(dt);--Guarda o tempo levado para terminar a fase
		physics_update(dt);----------Atualiza o mundo a cada frame
		stage2_update(dt);-----------Movimenta as nuvens
		joystick_update(dt);---------Ativa os comandos do controle
		animation_update(dt);--------Ativa animações do jogador
	end
	if(game_state == "stage3")then
		physics_stage_3();-----------Cria a física da fase 3
		game_controller_update(dt);--Guarda o tempo levado para terminar a fase
		physics_update(dt);----------Atualiza o mundo a cada frame
		stage3_update();---------------Movimenta as nuvens
		joystick_update(dt);---------Ativa os comandos do controle
		animation_update(dt);--------Ativa animações do jogador
		enemy_animation_update(dt);--Ativa animações do inimigo	
		enemy_move_between_2_pos(310,500);--Movimenta o inimigo na tela entre dois pontos quaisquer dados
	end
	if(game_state == "stage4")then
		physics_stage_4();-----------Cria a física da fase 4
		game_controller_update(dt);--Guarda o tempo levado para terminar a fase
		physics_update(dt);----------Atualiza o mundo a cada frame
		stage4_update(dt);-----------Faz a camera seguir o jogador e Movimenta as nuvens
		joystick_update(dt);---------Ativa os comandos do controle
		animation_update(dt);--------Ativa animações do jogador
	end
end

function love.draw()
	if(game_state == "main_menu")then
		draw_main_menu();
	end
	if(game_state == "stage1")then
		stage1_draw();-----------------Desenha o cenário da fase 1
		game_controller_draw();--------Desenha tudo que precisa ser chamado no Game Controller
		
	end
	if(game_state == "stage2")then
		stage2_draw();-----------------Desenha o cenário da fase 2
		game_controller_draw();--------Desenha tudo que precisa ser chamado no Game Controller
	end
	if(game_state == "stage3")then
		stage3_draw();-----------------Desenha o cenário da fase 3
		enemy_animation_draw();--------Desenha as animações dos inimigos da fase
		game_controller_draw();--------Desenha tudo que precisa ser chamado no Game Controller
	end
	if(game_state == "stage4")then
		stage4_draw();-----------------Desenha o cenário da fase 4
		game_controller_draw();--------Desenha tudo que precisa ser chamado no Game Controller
	end
end
------------------------------------------------------------------------------------