------------Códigos necessário para execução normal deste outro código---------
-------------------------------------------------------------------------------
-----------Declaração de todas variaveis referentes aos sons-------------------
sound = {};
-----------------------Todas os sons referentes a interface--------------------
sound.interface = {};
sound.interface.main_menu_theme = love.audio.newSource("Sounds/Naruto_OST_I_Said_I_m_Naruto.mp3", "stream");
sound.interface.main_menu_theme:setVolume(0.4);
sound.interface.main_menu_button_play = love.audio.newSource("Sounds/Naruto_knuckle_crack.mp3", "static");
sound.interface.congratulation = love.audio.newSource("Sounds/Victory Short SFX 10 Victoria Epic Win Efecto de Sonido.mp3", "static");
sound.interface.congratulation:setLooping(false);
sound.interface.congratulation:setVolume(0.5);
-----------------------Todas os sons referentes ao jogador--------------------
sound.player = {};
sound.player.walking = love.audio.newSource("Sounds/Footsteps_Sound_Effect_Royalty_Free.mp3","static");
sound.player.runing = love.audio.newSource("Sounds/Running_On_Concrete_sfx.mp3","static");
sound.player.jump = love.audio.newSource("Sounds/Naruto_jump_air3.mp3","static","static");
sound.player.jump_voice = love.audio.newSource("Sounds/Voice_Naruto/C1.wav","static");

sound.player.atack_voice_1 = love.audio.newSource("Sounds/Voice_Naruto/C2.wav","static");
sound.player.atack_voice_2 = love.audio.newSource("Sounds/Voice_Naruto/C3.wav","static");

sound.player.damage_voice = love.audio.newSource("Sounds/Voice_Naruto/C4.wav","static");

sound.player.rasengan_voice = love.audio.newSource("Sounds/Voice_Naruto/R5.wav","static");
--------------------------------------------------------------------------------
--------------------Configuração das variaveis de som---------------------------
sound.player.jump:setLooping(false);
sound.player.jump_voice:setLooping(false);

sound.scenario = {};
sound.scenario.river = love.audio.newSource("Sounds/river 1 sound effect from SFX WORLD HIGH QUALTIY.mp3","static");
sound.scenario.river:setVolume(0.2);

-------------Executa algum som especifico-------------
function play_this_song(song)
	love.audio.play(song);
end

------------Pausa algum som especifico----------------
function pause_this_songs(song)
	love.audio.pause(song);
end

----------Pausa todos sons que estão tocando---------
function pause_all_songs()
	love.audio.pause();
end

------------Para algum som especifico----------------
function stop_this_song(song)
	love.audio.stop(song);
end

---------Para todos os sons que estão tocando--------
function stop_all_songs()
	love.audio.stop();
end