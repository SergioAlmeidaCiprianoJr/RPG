Character = {}
Character.__index = Character

-- Const
local WALK_SPEED = 7
local MAX_LIFE = 0

function Character:new(x, y, name, level, imgFront, imgBack)
	local	self = setmetatable({}, Character)
	
	-- Variables
	self.name = name
	self.level = level
	self.life = MAX_LIFE
	self.direction = 'L' -- N / S / L / O
	self.x, self.y = x, y

	-- Image
	self.imgFront = love.graphics.newImage(imgFront)
	self.imgBack = love.graphics.newImage(imgBack)
	self.imgPrevious = self.imgFront

	-- Grid
	self.grid = anim8.newGrid(125, 148, self.imgFront:getWidth(), self.imgFront:getHeight(), 0, 0, 8)

	-- Animation
	self.animate = anim8.newAnimation(self.grid('1-3',1), 0.1)

	return self
end

function Character:update(dt)
	if self.direction ~= nil then
		self.animate:update(dt)
	else
		self.animate:gotoFrame(1)
	end	
	self:move()
end

function Character:draw()
	if self.direction == 'O' then
		self.animate:draw(self.imgBack, self.x, self.y)
		self.imgPrevious = self.imgBack
	elseif self.direction == 'L' then
		self.animate:draw(self.imgFront, self.x, self.y)
		self.imgPrevious = self.imgFront
	else
		self.animate:draw(self.imgPrevious, self.x, self.y)
	end
end

function Character:move()
	if love.keyboard.isDown('w') then
		self.y = self.y - WALK_SPEED
		self.direction = 'N'
	elseif love.keyboard.isDown('s') then
		self.y = self.y + WALK_SPEED
		self.direction = 'S'
	elseif love.keyboard.isDown('d') then
		self.x = self.x + WALK_SPEED
		self.direction = 'L'
	elseif love.keyboard.isDown('a') then
		self.x = self.x - WALK_SPEED
		self.direction = 'O'
	else
		self.direction = nil
	end  
end
