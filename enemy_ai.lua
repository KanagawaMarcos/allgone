require 'enemy_controller'
require 'player_controller'
require 'physic_controller'
require 'game_controller'


function enemy_move_between_2_pos (pos1,pos2)
	if(game_state == "stage4")then return end------------Outra gambiarra de ultima hora

	if(pos1 < pos2 and not enemy.data.atacking)then
		if (enemy.data.direction == "right")then
			konoha.enemy.body:setLinearVelocity(enemy.data.run_speed,0);
				if(konoha.enemy.body:getX() >= pos2 )then
					enemy.data.direction = "left";
				end
		elseif (enemy.data.direction == "left") then
			konoha.enemy.body:setLinearVelocity(-enemy.data.run_speed,0);
				if(konoha.enemy.body:getX() <= pos1 )then
					enemy.data.direction = "right";
				end
		end	
	elseif(pos1 > pos2 and not enemy.data.atacking)then
		if (enemy.data.direction == "right")then
			konoha.enemy.body:setLinearVelocity(enemy.data.run_speed,0);
				if(konoha.enemy.body:getX() >= pos1 )then
					enemy.data.direction = "left";
				end
		elseif (enemy.data.direction == "left") then
			konoha.enemy.body:setLinearVelocity(-enemy.data.run_speed,0);
				if(konoha.enemy.body:getX() <= pos2 )then
					enemy.data.direction = "right";
				end
		end
	end
end