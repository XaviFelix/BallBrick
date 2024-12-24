-- object definitions
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
-- End of Ball Class

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

-- End of Platform Class

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

-- End of Brick Class

Brick_List = {}
Brick_List.__index = Brick_List

function Brick_List:new(...)
	local self = setmetatable({}, Brick_List)

	self.list = {}

	local args = { ... } -- Collect the arguments into a table

	for _, brick in ipairs(args) do
		table.insert(self.list, brick)
	end

	return self
end

function Brick_List:insert(brick)
	table.insert(self.list, brick)
end

function Brick_List:drawBricks()
	for _, brick in ipairs(self.list) do
		brick:draw()
	end
end

-- NOTE: This is not defined yet in the tutorial that i am following
-- TODO: this would have to be called in the love.update function
function Brick_List:updateBrick(dt)
	print("This is a test")
end

-- End of Brick_List

-- Start of love framework

function love.load()
	-- Creating instances of the objects
	brickList = Brick_List:new()
	ball = Ball:new(300, 300, 10, 300, 300)
	platform = Platform:new(500, 500, 70, 20, 300)
	-- brick = Brick:new(100, 100, 50, 30)
	brickList:insert(Brick:new(100, 100, 50, 30))
	brickList:insert(Brick:new(160, 100, 50, 30))
end

function love.update(dt)
	-- Move the ball
	ball:update(dt)
	brickList:updateBrick(dt)
	-- Platform movement
	movePlatform(dt)
end

function love.draw()
	ball:draw()
	platform:draw()
	brickList:drawBricks()
end

-- NOTE:  Defined functions
-- TODO: Create a function that will populate a set of bricks for a arbritrary level

function movePlatform(dt)
	if love.keyboard.isDown("right") then
		platform.x = platform.x + platform.speed_x * dt
	end

	if love.keyboard.isDown("left") then
		platform.x = platform.x - platform.speed_x * dt
	end
end
