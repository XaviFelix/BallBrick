local love = require("love")
local Ball = require("utils.ball")
local Platform = require("utils.platform")
local Brick = require("utils.brick")
local Brick_List = require("utils.brick_list")
local input = require("utils.input")

local platform = nil
local brickList = nil
local ball = nil

-- Start of love framework

function love.load()
	brickList = Brick_List:new()
	ball = Ball:new(300, 300, 10, 300, 300)
	platform = Platform:new(500, 500, 70, 20, 300)
	brickList:constructLevel()

	-- Debug code
	brickList:printList()
end

function love.update(dt)
	if ball ~= nil and brickList ~= nil then
		ball:update(dt)
		brickList:updateBrick(dt)
	end
	input.movePlatform(platform, dt)
end

function love.draw()
	if ball ~= nil and platform ~= nil and brickList ~= nil then
		ball:draw()
		platform:draw()
		brickList:drawBricks()
	end
end
