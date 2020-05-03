-- classes
require('/src/keyboard')
require('/src/map')
-- humanoid
require('/src/humanoid/player')
-- libraries
anim8 = require('/src/libraries/anim8')

local background, p

function love.load()
	player = Player:new(82, 200, 'Sergio', 'pixel_art/protagonist/demon_warrior_grid.png', 'pixel_art/protagonist/demon_warrior_grid_iv.png')
	map = Map:new('', 'pixel_art/scenario/cidade.png')
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	map:draw()
	player:draw()
end