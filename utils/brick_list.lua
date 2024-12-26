local Brick = require("utils.brick")

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

-- NOTE: This currently works
-- TODO: This needs more testing to ensure edge cases don't break it
function Brick_List:constructLevel()
	self.rows = 8
	self.columns = 11
	self.current_level_bricks = {}

	local brick = Brick:new()

	for row = 1, self.rows do
		for col = 1, self.columns do
			local new_brick_pos_x = brick.top_left_pos_x + (col - 1) * (brick.width + brick.horizontal_distance)
			local new_brick_pos_y = brick.top_left_pos_y + (row - 1) * (brick.height + brick.vertical_distance)

			local new_brick = Brick:new(new_brick_pos_x, new_brick_pos_y)

			self:insert(new_brick)
		end
	end
end

function Brick_List:drawBricks()
	for _, brick in ipairs(self.list) do
		brick:draw()
	end
end

function Brick_List:updateBrick(dt)
	print("This function is called from a different file")
end

return Brick_List
-- End of Brick_List
