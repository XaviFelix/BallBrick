Brick = {}
Brick.__index = Brick

function Brick:new(x, y, width, height)
	local self = setmetatable({}, Brick)

	self.x = x or 100
	self.y = y or 100
	self.width = width or 50
	self.height = height or 30

	-- TODO: Test this code properly
	self.top_left_pos_x = 70
	self.top_left_pos_y = 50
	self.horizontal_distance = 10
	self.vertical_distance = 15
	return self
end

function Brick:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Brick

-- End of Brick Class
