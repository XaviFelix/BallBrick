Ball = {}
Ball.__index = Ball

function Ball:new(x, y, radius, speed_x, speed_y)
	local self = setmetatable({}, Ball)

	self.x = x or 300
	self.y = y or 300
	self.radius = radius or 10
	self.speed_x = speed_x or 300
	self.speed_y = speed_y or 300
	return self
end

function Ball:update(dt)
	self.x = self.x + self.speed_x * dt
	self.y = self.y + self.speed_y * dt
end

function Ball:draw()
	local segments_in_circle
	love.graphics.circle("line", self.x, self.y, self.radius, segments_in_circle)
end

return Ball
-- End of Ball Class
