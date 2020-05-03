Map = {}
Map.__index = Map

function Map:new(name, image)
	local sef = setmetatable({}, Map)

	-- Variables
	self.name = name

	-- Image
	self.background = love.graphics.newImage(image)
	love.window.setFullscreen(true, "desktop")

	return self
end

function Map:draw()
	love.graphics.draw(self.background, 0, 0)
end
