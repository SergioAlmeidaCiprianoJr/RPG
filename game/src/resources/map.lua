Map = {}
Map.__index = Map

function Map:new(name, image, collision)
	local sef = setmetatable({}, Map)

	-- Variables
	self.name = name

	-- Image
	self.background = love.graphics.newImage(image)
	love.window.setFullscreen(true, "desktop")

	-- Colliders
	self.lineColliders = {}
	self:setLineColliders(collision)

	return self
end

function Map:draw()
	love.graphics.draw(self.background, 0, 0)
end

function Map:setLineColliders(collision)
	for k, v in pairs(collision) do
		self.lineColliders = world:newLineCollider(v[1], v[2], v[3], v[4])
		self.lineColliders:setType('static')
	end
end
