Brick = {}
Brick.__index = Brick

function Brick:new(x, y, width, height)
	local self = setmetatable({}, Brick)

	self.x = x or 100
	self.y = y or 100
	self.width = width or 50
	self.height = height or 30
	return self
end

function Brick:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Brick

-- End of Brick Class
