---------------------------------------------------------------------------------------------------
--Xerox, by dragaron-------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------
--INITIALIZATION START-----------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
	--Setup directory
	if files.exists("samples/xerox.lua") then
	dir = "samples/xerox/"
	else
	dir = "resources/"
	end

	--Read from, or create if nonexistent, "config.ini" file
	if files.exists(dir .. "config.ini") then
	game_type = tonumber(ini.read(dir .. "config.ini", "game_type", 1))
	skill_level = tonumber(ini.read(dir .. "config.ini", "skill_level", 1))
	last_signal_max = tonumber(ini.read(dir .. "config.ini", "last_signal_max", 1))
	last_signal_sequence = tonumber(ini.read(dir .. "config.ini", "last_signal_sequence", 3))
	longest_signal_max = tonumber(ini.read(dir .. "config.ini", "longest_signal_max", 1))
	longest_signal_sequence = tonumber(ini.read(dir .. "config.ini", "longest_signal_sequence", 3))
	else
	ini.write(dir .. "config.ini", "game_type", 1)
	ini.write(dir .. "config.ini", "skill_level", 1)
	ini.write(dir .. "config.ini", "last_signal_max", 1)
	ini.write(dir .. "config.ini", "last_signal_sequence", 3)
	ini.write(dir .. "config.ini", "longest_signal_max", 1)
	ini.write(dir .. "config.ini", "longest_signal_sequence", 3)
	game_type = tonumber(ini.read(dir .. "config.ini", "game_type", 1))
	skill_level = tonumber(ini.read(dir .. "config.ini", "skill_level", 1))
	last_signal_max = tonumber(ini.read(dir .. "config.ini", "last_signal_max", 1))
	last_signal_sequence = tonumber(ini.read(dir .. "config.ini", "last_signal_sequence", 3))
	longest_signal_max = tonumber(ini.read(dir .. "config.ini", "longest_signal_max", 1))
	longest_signal_sequence = tonumber(ini.read(dir .. "config.ini", "longest_signal_sequence", 3))
	end

--Load 19 basic colors (red, green, blue, cyan, magenta, yellow, maroon, grass, navy, turquoise, violet, olive, white, gray, black, orange, chocolate, shine, shadow)
color.loadpalette()


--VFX----------------------------------------------------------------------------------------------
vfx_battery = image.load(dir .. "vfx_battery.png")
vfx_battery_charge = image.load(dir .. "vfx_battery_charge.png")
vfx_bg = image.load(dir .. "vfx_bg.png")
vfx_button01 = image.load(dir .. "vfx_button01.png")
vfx_button01_01 = image.load(dir .. "vfx_button01_01.png")
vfx_button01_02 = image.load(dir .. "vfx_button01_02.png")
vfx_button01_03 = image.load(dir .. "vfx_button01_03.png")
vfx_button01_04 = image.load(dir .. "vfx_button01_04.png")
vfx_button01_bg = image.load(dir .. "vfx_button01_bg.png")
vfx_button02 = image.load(dir .. "vfx_button02.png")
vfx_button02_01 = image.load(dir .. "vfx_button02_01.png")
vfx_button02_02 = image.load(dir .. "vfx_button02_02.png")
vfx_button02_03 = image.load(dir .. "vfx_button02_03.png")
vfx_button02_04 = image.load(dir .. "vfx_button02_04.png")
vfx_button02_bg = image.load(dir .. "vfx_button02_bg.png")
vfx_button03a = image.load(dir .. "vfx_button03a.png")
vfx_button03b = image.load(dir .. "vfx_button03b.png")
vfx_button04a = image.load(dir .. "vfx_button04a.png")
vfx_button04b = image.load(dir .. "vfx_button04b.png")
vfx_button05a = image.load(dir .. "vfx_button05a.png")
vfx_button05b = image.load(dir .. "vfx_button05b.png")
vfx_button06a = image.load(dir .. "vfx_button06a.png")
vfx_button06b = image.load(dir .. "vfx_button06b.png")
vfx_button07 = image.load(dir .. "vfx_button07.png")
vfx_button07_bg = image.load(dir .. "vfx_button07_bg.png")
vfx_button07a = image.load(dir .. "vfx_button07a.png")
vfx_button07b = image.load(dir .. "vfx_button07b.png")
vfx_button08 = image.load(dir .. "vfx_button08.png")
vfx_button08_bg = image.load(dir .. "vfx_button08_bg.png")
vfx_button08a = image.load(dir .. "vfx_button08a.png")
vfx_button08b = image.load(dir .. "vfx_button08b.png")
vfx_button09 = image.load(dir .. "vfx_button09.png")
vfx_button09_bg = image.load(dir .. "vfx_button09_bg.png")
vfx_button09a = image.load(dir .. "vfx_button09a.png")
vfx_button09b = image.load(dir .. "vfx_button09b.png")
vfx_frame01 = image.load(dir .. "vfx_frame01.png")
vfx_frame02 = image.load(dir .. "vfx_frame02.png")
vfx_x = image.load(dir .. "vfx_x.png")
vfx_xerox = image.load(dir .. "vfx_xerox.png")


--SFX----------------------------------------------------------------------------------------------
sfx_button00 = sound.load(dir .. "sfx_button00.mp3")
sfx_button03 = sound.load(dir .. "sfx_button03.mp3")
sfx_button04 = sound.load(dir .. "sfx_button04.mp3")
sfx_button05 = sound.load(dir .. "sfx_button05.mp3")
sfx_button06 = sound.load(dir .. "sfx_button06.mp3")
sfx_game_over = sound.load(dir .. "sfx_game_over.mp3")


--BOOLEONS-----------------------------------------------------------------------------------------
game_setup = true


--VARIABLES----------------------------------------------------------------------------------------
button_pressed = 0
button_held = 0
button_released = 0


--TABLES-------------------------------------------------------------------------------------------
button = {"up", "down", "left", "right", "triangle", "cross", "square", "circle", "l", "r", "select", "start", "home", "volup", "voldown"}


--FUNCTIONS----------------------------------------------------------------------------------------
function setup_signal()
signal = {}
math.randomseed(os.time())
	for i = 1, 31 do
	signal[i] = math.random(3, 6)
	end
end


function display_vfx01()
image.blit(vfx_bg, 0, 0, 255)
image.blit(vfx_x, 0, 0, 50)
image.blit(vfx_frame01, 0, 0, 255)
image.blit(vfx_frame02, 0, 0, 255)
image.blit(vfx_button01_bg, 0, 0, 50)
image.blit(vfx_button01, 0, 0, 255)
image.blit(vfx_button02_bg, 0, 0, 50)
image.blit(vfx_button02, 0, 0, 255)
image.blit(vfx_button07_bg, 0, 0, 50)
image.blit(vfx_button07, 0, 0, 255)
image.blit(vfx_button08_bg, 0, 0, 50)
image.blit(vfx_button08, 0, 0, 255)
image.blit(vfx_button09_bg, 0, 0, 50)
image.blit(vfx_button09, 0, 0, 255)
	if game_type == 1 then
	image.blit(vfx_button01_01, 0, 0, 255)
	else
	image.blit(vfx_button01_01, 0, 0, 50)
	end
	if game_type == 2 then
	image.blit(vfx_button01_02, 0, 0, 255)
	else
	image.blit(vfx_button01_02, 0, 0, 50)
	end
	if game_type == 3 then
	image.blit(vfx_button01_03, 0, 0, 255)
	else
	image.blit(vfx_button01_03, 0, 0, 50)
	end
	if game_type == 4 then
	image.blit(vfx_button01_04, 0, 0, 255)
	else
	image.blit(vfx_button01_04, 0, 0, 50)
	end
	if skill_level == 1 then
	image.blit(vfx_button02_01, 0, 0, 255)
	else
	image.blit(vfx_button02_01, 0, 0, 50)
	end
	if skill_level == 2 then
	image.blit(vfx_button02_02, 0, 0, 255)
	else
	image.blit(vfx_button02_02, 0, 0, 50)
	end
	if skill_level == 3 then
	image.blit(vfx_button02_03, 0, 0, 255)
	else
	image.blit(vfx_button02_03, 0, 0, 50)
	end
	if skill_level == 4 then
	image.blit(vfx_button02_04, 0, 0, 255)
	else
	image.blit(vfx_button02_04, 0, 0, 50)
	end
	if batt.charging() == true then
	image.blit(vfx_battery_charge, 860, 6, 255)
	else
	image.blit(vfx_battery, 860, 6, 255)
	end
screen.print(895, 3, batt.lifepercent() .. "%")
screen.print(20, 3, os.date("%a %m/%d/%y    %I:%M:%S %p"))
end


function display_vfx02()
	if button_held == 1 then
	end
	if button_held == 2 then
	end
	if button_held == 3 then
	image.blit(vfx_button03b, 0, 0, 255)
	else
	image.blit(vfx_button03a, 0, 0, 255)	
	end
	if button_held == 4 then
	image.blit(vfx_button04b, 0, 0, 255)
	else
	image.blit(vfx_button04a, 0, 0, 255)	
	end
	if button_held == 5 then
	image.blit(vfx_button05b, 0, 0, 255)
	else
	image.blit(vfx_button05a, 0, 0, 255)	
	end
	if button_held == 6 then
	image.blit(vfx_button06b, 0, 0, 255)
	else
	image.blit(vfx_button06a, 0, 0, 255)	
	end
	if button_held == 7 then
	image.blit(vfx_button07b, 0, 0, 255)
	else
	image.blit(vfx_button07a, 0, 0, 255)	
	end
	if button_held == 8 then
	image.blit(vfx_button08b, 0, 0, 255)
	else
	image.blit(vfx_button08a, 0, 0, 255)	
	end
	if button_held == 9 then
	image.blit(vfx_button09b, 0, 0, 255)
	else
	image.blit(vfx_button09a, 0, 0, 255)	
	end
end


function play_sfx()
	if button_pressed >=1 then
		if sound.playing(sfx_button00) then
		sound.stop(sfx_button00)
		end
		if sound.playing(sfx_button03) then
		sound.stop(sfx_button03)
		end
		if sound.playing(sfx_button04) then
		sound.stop(sfx_button04)
		end
		if sound.playing(sfx_button05) then
		sound.stop(sfx_button05)
		end
		if sound.playing(sfx_button06) then
		sound.stop(sfx_button06)
		end
	end
	if button_pressed == 1 then
	sound.play(sfx_button00)
	end
	if button_pressed == 2 then
	sound.play(sfx_button00)
	end
	if button_pressed == 3 then
	sound.play(sfx_button03)
	end
	if button_pressed == 4 then
	sound.play(sfx_button04)
	end
	if button_pressed == 5 then
	sound.play(sfx_button05)
	end
	if button_pressed == 6 then
	sound.play(sfx_button06)
	end
	if button_pressed == 7 then
	sound.play(sfx_button00)
	end
	if button_pressed == 8 then
	sound.play(sfx_button00)
	end
	if button_pressed == 9 then
	sound.play(sfx_button00)
	end
end


function touch_check()
touch.read()
button_pressed = 0
	if touch.front[1].pressed == true then
		if touch.front[1].x >= 361 and touch.front[1].x <= 478 and touch.front[1].y >= 167 and touch.front[1].y <= 232 then
		button_pressed = 1
		end
		if touch.front[1].x >= 482 and touch.front[1].x <= 599 and touch.front[1].y >= 167 and touch.front[1].y <= 232 then
		button_pressed = 2
		end
		if touch.front[1].x >= 22 and touch.front[1].x <= 472 and touch.front[1].y >= 50 and touch.front[1].y <= 161 or touch.front[1].x >= 22 and touch.front[1].x <= 355 and touch.front[1].y >= 161 and touch.front[1].y <= 278 then
		button_pressed = 3
		end
		if touch.front[1].x >= 488 and touch.front[1].x <= 938 and touch.front[1].y >= 50 and touch.front[1].y <= 161 or touch.front[1].x >= 605 and touch.front[1].x <= 938 and touch.front[1].y >= 161 and touch.front[1].y <= 278 then
		button_pressed = 4
		end
		if touch.front[1].x >= 22 and touch.front[1].x <= 355 and touch.front[1].y >= 294 and touch.front[1].y <= 411 or touch.front[1].x >= 22 and touch.front[1].x <= 477 and touch.front[1].y >= 411 and touch.front[1].y <= 522 then
		button_pressed = 5
		end
		if touch.front[1].x >= 605 and touch.front[1].x <= 938 and touch.front[1].y >= 294 and touch.front[1].y <= 411 or touch.front[1].x >= 488 and touch.front[1].x <= 938 and touch.front[1].y >= 411 and touch.front[1].y <= 522 then
		button_pressed = 6
		end
		if touch.front[1].x >= 361 and touch.front[1].x <= 438 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_pressed = 7	
		end
		if touch.front[1].x >= 441 and touch.front[1].x <= 518 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_pressed = 8
		end
		if touch.front[1].x >= 521 and touch.front[1].x <= 598 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_pressed = 9
		end
	end
button_held = 0
	if touch.front[1].held == true then
		if touch.front[1].x >= 361 and touch.front[1].x <= 478 and touch.front[1].y >= 167 and touch.front[1].y <= 232 then
		button_held = 1
		end
		if touch.front[1].x >= 482 and touch.front[1].x <= 599 and touch.front[1].y >= 167 and touch.front[1].y <= 232 then
		button_held = 2
		end
		if touch.front[1].x >= 22 and touch.front[1].x <= 472 and touch.front[1].y >= 50 and touch.front[1].y <= 161 or touch.front[1].x >= 22 and touch.front[1].x <= 355 and touch.front[1].y >= 161 and touch.front[1].y <= 278 then
		button_held = 3
		end
		if touch.front[1].x >= 488 and touch.front[1].x <= 938 and touch.front[1].y >= 50 and touch.front[1].y <= 161 or touch.front[1].x >= 605 and touch.front[1].x <= 938 and touch.front[1].y >= 161 and touch.front[1].y <= 278 then
		button_held = 4
		end
		if touch.front[1].x >= 22 and touch.front[1].x <= 355 and touch.front[1].y >= 294 and touch.front[1].y <= 411 or touch.front[1].x >= 22 and touch.front[1].x <= 477 and touch.front[1].y >= 411 and touch.front[1].y <= 522 then
		button_held = 5
		end
		if touch.front[1].x >= 605 and touch.front[1].x <= 938 and touch.front[1].y >= 294 and touch.front[1].y <= 411 or touch.front[1].x >= 488 and touch.front[1].x <= 938 and touch.front[1].y >= 411 and touch.front[1].y <= 522 then
		button_held = 6
		end
		if touch.front[1].x >= 361 and touch.front[1].x <= 438 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_held = 7	
		end
		if touch.front[1].x >= 441 and touch.front[1].x <= 518 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_held = 8
		end
		if touch.front[1].x >= 521 and touch.front[1].x <= 598 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_held = 9
		end
	end
button_released = 0
	if touch.front[1].released == true then
		if touch.front[1].x >= 361 and touch.front[1].x <= 478 and touch.front[1].y >= 167 and touch.front[1].y <= 232 then
		button_released = 1
		end
		if touch.front[1].x >= 482 and touch.front[1].x <= 599 and touch.front[1].y >= 167 and touch.front[1].y <= 232 then
		button_released = 2
		end
		if touch.front[1].x >= 22 and touch.front[1].x <= 472 and touch.front[1].y >= 50 and touch.front[1].y <= 161 or touch.front[1].x >= 22 and touch.front[1].x <= 355 and touch.front[1].y >= 161 and touch.front[1].y <= 278 then
		button_released = 3
		end
		if touch.front[1].x >= 488 and touch.front[1].x <= 938 and touch.front[1].y >= 50 and touch.front[1].y <= 161 or touch.front[1].x >= 605 and touch.front[1].x <= 938 and touch.front[1].y >= 161 and touch.front[1].y <= 278 then
		button_released = 4
		end
		if touch.front[1].x >= 22 and touch.front[1].x <= 355 and touch.front[1].y >= 294 and touch.front[1].y <= 411 or touch.front[1].x >= 22 and touch.front[1].x <= 477 and touch.front[1].y >= 411 and touch.front[1].y <= 522 then
		button_released = 5
		end
		if touch.front[1].x >= 605 and touch.front[1].x <= 938 and touch.front[1].y >= 294 and touch.front[1].y <= 411 or touch.front[1].x >= 488 and touch.front[1].x <= 938 and touch.front[1].y >= 411 and touch.front[1].y <= 522 then
		button_released = 6
		end
		if touch.front[1].x >= 361 and touch.front[1].x <= 438 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_released = 7	
		end
		if touch.front[1].x >= 441 and touch.front[1].x <= 518 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_released = 8
		end
		if touch.front[1].x >= 521 and touch.front[1].x <= 598 and touch.front[1].y >= 339 and touch.front[1].y <= 404 then
		button_released = 9
		end
	end
end


--Assumes 30F/second; cannot interrupt
function wait(frame)
frame = frame * 0.034
time = os.clock() + frame
	while os.clock() < time do
	end
end


--Assumes 30F/second; can interrupt with button or touch input
function pause(frame)
frame = frame * 0.034
time = os.clock() + frame
	while os.clock() < time do
	buttons.read()
		for i = 1, #button do
			if buttons[button[i]] then
			time = os.clock()
			end
		end
	touch_check()
		if button_pressed > 1 then
		time = os.clock()
		end
	end
end


--For "Last" and "Longest" buttons
function playback()
current_signal = 1
display_vfx01()
button_held = 0
display_vfx02()
image.blit(vfx_xerox, 0, 0, 255)
screen:flip()
wait(15)
	while current_signal <= current_signal_max do
		for i = 1, 31 do
			if current_signal == i then
			current_signal_value = signal[i]
			end
		end
	display_vfx01()
	button_held = 0
	display_vfx02()
	image.blit(vfx_xerox, 0, 0, 255)
	screen.print(400, 3, "INFO: Playing past sequence...")
	screen:flip()
	wait(1)
	display_vfx01()
	button_held = current_signal_value
	display_vfx02()
	image.blit(vfx_xerox, 0, 0, 255)
	screen.print(400, 3, "INFO: Playing past sequence...")
	screen:flip()
	button_pressed = current_signal_value
	play_sfx()
	wait(5)
		if current_signal_max <= 5 then
		wait(3)
		end
		if current_signal_max <= 9 then
		wait(3)
		end
		if current_signal_max <= 13 then
		wait(3)
		end
	current_signal = current_signal + 1
	end
current_signal_max = 1	
setup_signal()
end


--SCRIPT STORAGE-----------------------------------------------------------------------------------
--[[
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
--]]


---------------------------------------------------------------------------------------------------
--INITIALIZATION END-------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------
--MAIN START---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
	while true do

		if game_setup == true then
		current_signal_max = 1	
		setup_signal()
			while true do
			display_vfx01()
			touch_check()
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: Press START to begin.")
			screen:flip()
			play_sfx()
				if button_pressed == 1 then
				game_type = game_type + 1
					if game_type >= 5 then
					game_type = 1
					end
				ini.write(dir .. "config.ini", "game_type", game_type)
				end
				if button_pressed == 2 then
				skill_level = skill_level + 1
					if skill_level >= 5 then
					skill_level = 1
					end
				ini.write(dir .. "config.ini", "skill_level", skill_level)
				end
				if button_pressed == 7 then
				current_signal_max = tonumber(ini.read(dir .. "config.ini", "last_signal_max", 1))
					for i = 1, 31 do
					signal[i] = tonumber(string.sub(ini.read(dir .. "config.ini", "last_signal_sequence", 3), i, i))
					end
				playback()
				end			
				if button_pressed == 8 then
				game_setup = false
				break
				end
				if button_pressed == 9 then
				current_signal_max = tonumber(ini.read(dir .. "config.ini", "longest_signal_max", 1))
					for i = 1, 31 do
					signal[i] = tonumber(string.sub(ini.read(dir .. "config.ini", "longest_signal_sequence", 3), i, i))
					end
				playback()
				end
			end
			if skill_level == 1 then
			total_signal_max = 8
			end
			if skill_level == 2 then
			total_signal_max = 14
			end
			if skill_level == 3 then
			total_signal_max = 20
			end
			if skill_level == 4 then
			total_signal_max = 31
			end
		end	

	
	current_signal = 1
		if game_type == 3 or game_type == 4 then
		setup_signal()
		end
	display_vfx01()
	button_held = 0
	display_vfx02()
	image.blit(vfx_xerox, 0, 0, 255)
	screen:flip()
	wait(15)
		while current_signal <= current_signal_max do
			for i = 1, 31 do
				if current_signal == i then
				current_signal_value = signal[i]
				end
			end
		display_vfx01()
		button_held = 0
		display_vfx02()
		image.blit(vfx_xerox, 0, 0, 255)
		screen.print(400, 3, "INFO: Playing sequence...")
		screen:flip()
		wait(1)
		display_vfx01()
		button_held = current_signal_value
		display_vfx02()
		image.blit(vfx_xerox, 0, 0, 255)
		screen.print(400, 3, "INFO: Playing sequence...")
		screen:flip()
		button_pressed = current_signal_value
		play_sfx()
		wait(5)
			if current_signal_max <= 5 then
			wait(3)
			end
			if current_signal_max <= 9 then
			wait(3)
			end
			if current_signal_max <= 13 then
			wait(3)
			end
		current_signal = current_signal + 1
		end


	current_signal = 1
	display_vfx01()
	button_held = 0
	display_vfx02()
	image.blit(vfx_xerox, 0, 0, 255)
	screen:flip()
	n = 255
		while n > 155 do
		display_vfx01()
		display_vfx02()
		image.blit(vfx_xerox, 0, 0, n)
		screen:flip()
		n = n - 50
		end
	n = 155
		while n < 255 do
		display_vfx01()
		display_vfx02()
		image.blit(vfx_xerox, 0, 0, n)
		screen:flip()
		n = n + 50
		end
		while current_signal <= current_signal_max do
			if game_type == 2 or game_type == 4 then
			current_signal_temp = current_signal
			current_signal = (current_signal_max - current_signal) + 1
			end	
			for i = 1, 31 do
				if current_signal == i then
				current_signal_value = signal[i]
				end
			end
			if game_type == 2 or game_type == 4 then
			current_signal = current_signal_temp
			end
		--Should be n = 90 (90 frames, or 3 seconds), but is decreased to account for processing time
		n = 60
			while n > 0 do
			display_vfx01()
			button_held = 0
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			draw.fillrect(387, 271, 184, 28, color.black)
			draw.fillrect(389, 273, 180, 24, color.gray)
			draw.fillrect(389, 273, n*3, 24, color.white)
			screen.print(400, 3, "INFO: Enter sequence...  " .. current_signal .. "/" .. current_signal_max .. " (" .. total_signal_max .. ")")
			screen:flip()
			pause(1)
			n = n - 1
				if button_pressed > 1 then
				n = 0
				end
			end
		display_vfx01()
		display_vfx02()
		image.blit(vfx_xerox, 0, 0, 255)
		screen.print(400, 3, "INFO: Enter sequence...  " .. current_signal .. "/" .. current_signal_max .. " (" .. total_signal_max .. ")")
		screen:flip()
		play_sfx()
		wait(5)
			if button_pressed == current_signal_value then
			current_signal = current_signal + 1
			else
			display_vfx01()
			button_held = current_signal_value
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: GAME OVER!")
			screen:flip()
			button_pressed = 0
			play_sfx()
			sound.play(sfx_game_over)			
			wait(45)
			game_setup = true
			break
			end
		end


		if game_setup == false then
			if current_signal_max == total_signal_max then
			display_vfx01()
			button_held = 0
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: CONGRATULATIONS!")
			screen:flip()		
			wait(10)
			display_vfx01()
			button_held = 3
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: CONGRATULATIONS!")
			screen:flip()
			button_pressed = 3
			play_sfx()
			wait(5)
			display_vfx01()
			button_held = 4
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: CONGRATULATIONS!")
			screen:flip()
			button_pressed = 4		
			play_sfx()
			wait(5)
			display_vfx01()
			button_held = 5
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: CONGRATULATIONS!")
			screen:flip()
			button_pressed = 5		
			play_sfx()
			wait(5)
			display_vfx01()
			button_held = 6
			display_vfx02()
			image.blit(vfx_xerox, 0, 0, 255)
			screen.print(400, 3, "INFO: CONGRATULATIONS!")
			screen:flip()
			button_pressed = 6		
			play_sfx()
			wait(15)
			game_setup = true
			end
		end
 
 
	ini.write(dir .. "config.ini", "last_signal_max", current_signal_max)
	ini.write(dir .. "config.ini", "last_signal_sequence", signal[1] .. signal[2] .. signal[3] .. signal[4] .. signal[5] .. signal[6] .. signal[7] .. signal[8] .. signal[9] .. signal[10] .. signal[11] .. signal[12] .. signal[13] .. signal[14] .. signal[15] .. signal[16] .. signal[17] .. signal[18] .. signal[19] .. signal[20] .. signal[21] .. signal[22] .. signal[23] .. signal[24] .. signal[25] .. signal[26] .. signal[27] .. signal[28] .. signal[29] .. signal[30] .. signal[31])
		if current_signal_max >= longest_signal_max then
		longest_signal_max = current_signal_max
		ini.write(dir .. "config.ini", "longest_signal_max", current_signal_max)
		ini.write(dir .. "config.ini", "longest_signal_sequence", signal[1] .. signal[2] .. signal[3] .. signal[4] .. signal[5] .. signal[6] .. signal[7] .. signal[8] .. signal[9] .. signal[10] .. signal[11] .. signal[12] .. signal[13] .. signal[14] .. signal[15] .. signal[16] .. signal[17] .. signal[18] .. signal[19] .. signal[20] .. signal[21] .. signal[22] .. signal[23] .. signal[24] .. signal[25] .. signal[26] .. signal[27] .. signal[28] .. signal[29] .. signal[30] .. signal[31])
		end
	current_signal_max = current_signal_max + 1
	
	end
---------------------------------------------------------------------------------------------------
--MAIN END-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------