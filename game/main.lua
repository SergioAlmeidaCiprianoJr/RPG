-- libraries
camera = require('src/libraries/camera')
anim8 = require('src/libraries/anim8')
wf = require('src/libraries/windfield')
-- interface
require('src/interface/menu_options')
-- map
require('src/map')
-- humanoid
require('src/humanoid/player')

function love.load()
	world = wf.newWorld()
	player = Player:new(100, 200, 'Sergio', 'pixel_art/protagonist/demon_warrior_grid.png', 'pixel_art/protagonist/demon_warrior_grid_iv.png')
	map = Map:new('', 'pixel_art/scenario/battlefield.png')
end

function love.update(dt)
	player:update(dt)
	world:update(dt)
end

function love.draw()
	camera:set()
	map:draw()
	player:draw()
	world:draw()
	camera:unset()
end
