-- classes
require('/src/player')
require('/src/keyboard')
-- libraries
anim8 = require('/src/libraries/anim8')

local background, p

function love.load()
	player = Player:new(82,200,'Sergio')
	background = love.graphics.newImage('pixel_art/scenario/cidade.png')
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	player:draw()
end
