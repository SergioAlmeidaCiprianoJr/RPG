-- classes
require('/src/keyboard')
require('/src/map')
-- humanoid
require('/src/humanoid/player')
-- libraries
camera = require('/src/libraries/camera')
anim8 = require('/src/libraries/anim8')

local background, p

function love.load()
	player = Player:new(100, 200, 'Sergio', 'pixel_art/protagonist/demon_warrior_grid.png', 'pixel_art/protagonist/demon_warrior_grid_iv.png')
	map = Map:new('', 'pixel_art/scenario/battlefield.png')
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	camera:set()
	map:draw()
	player:draw()
	camera:unset()
end
