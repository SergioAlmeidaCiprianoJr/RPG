-- libraries
camera = require('src/libraries/camera')
anim8 = require('src/libraries/anim8')
wf = require('src/libraries/windfield')
-- interface
require('src/interface/menu_options')
-- resources
require('src/resources/map')
require('src/resources/manage_resources')
-- humanoid
require('src/humanoid/player')

function love.load()
	loadResources()
end

function love.update(dt)
	updateResources(dt)
end

function love.draw()
	drawResources()
end
