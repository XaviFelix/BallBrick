Platform = {}
Platform.__index = Platform

function Platform:new(x, y, width, height, speed_x)
	local self = setmetatable({}, Platform)

	self.x = x or 500
	self.y = y or 500
	self.width = width or 70
	self.height = height or 20
	self.speed_x = speed_x or 300
	return self
end

function Platform:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Platform

-- End of Platform Class
