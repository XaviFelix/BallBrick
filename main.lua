local Ball = require("utils.ball")
local Platform = require("utils.platform")
local Brick = require("utils.brick")
local Brick_List = require("utils.brick_list")
local input = require("utils.input")

-- Start of love framework

function love.load()
	-- Creating instances of the objects
	brickList = Brick_List:new()
	ball = Ball:new(300, 300, 10, 300, 300)
	platform = Platform:new(500, 500, 70, 20, 300)
	-- brick = Brick:new(100, 100, 50, 30)
	-- brickList:insert(Brick:new(100, 100, 50, 30))
	-- brickList:insert(Brick:new(160, 100, 50, 30))
	brickList:constructLevel()
end

function love.update(dt)
	-- Move the ball
	ball:update(dt)
	brickList:updateBrick(dt)
	-- Platform movement
	input.movePlatform(dt)
end

function love.draw()
	ball:draw()
	platform:draw()
	brickList:drawBricks()
end

-- NOTE:  Defined functions
-- TODO: Create a function that will populate a set of bricks for a arbritrary level
