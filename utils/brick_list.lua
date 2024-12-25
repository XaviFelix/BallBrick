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
	print("This function is called from a different file")
end

return Brick_List
-- End of Brick_List
