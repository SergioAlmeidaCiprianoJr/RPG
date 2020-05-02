-- libraries
anim8 = require('/src/libraries/anim8')
-- classes
require('/src/player')

local background, p

function love.load()
	background = love.graphics.newImage('pixel_art/scenario/teste.png')
	player = Player:new(82,200,'Sergio')
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	player:draw(image, player.x, player.y)
end
