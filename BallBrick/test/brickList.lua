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

function Brick_List:printList()
	for i, brick in ipairs(self.list) do
		print("Brick " .. i .. ": x = " .. brick.x .. ", y = " .. brick.y)
	end
end

-- End of Brick_List

local brick1 = Brick:new(50, 50, 60, 20)
local brick2 = Brick:new(50, 50, 60, 20)
local brick3 = Brick:new(50, 50, 60, 20)

local brickList = Brick_List:new(brick1, brick2, brick3)

brickList:printList()

print("Now i am going to try and insert a new brick and then print: ")

local brick4 = Brick:new(2323, 232124, 4545, 566)
local brick5 = Brick:new(232, 23, 545, 634)

brickList:insert(brick4)
brickList:insert(brick5)

brickList:printList()
