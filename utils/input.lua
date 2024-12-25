local input = {}

function input.movePlatform(dt)
	if love.keyboard.isDown("right") then
		platform.x = platform.x + platform.speed_x * dt
	end

	if love.keyboard.isDown("left") then
		platform.x = platform.x - platform.speed_x * dt
	end
end

return input
