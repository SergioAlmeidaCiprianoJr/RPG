Player = {}
Player.__index = Player

-- Const
local WALK_SPEED = 7
local MAX_LIFE = 0

function Player:new(x, y, name, imgFront, imgBack)
	self = setmetatable({}, Player)
	
	-- Variables
	self.name = name
	self.level = 1
	self.life = MAX_LIFE
	self.numberSpells = 0
	self.direction = 'right'
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

function Player:update(dt)
	self:move()
	if self.direction ~= nil then
		self.animate:update(dt)
	else
		self.animate:gotoFrame(1)
	end	
end

function Player:draw()
	if self.direction == 'left' then
		self.animate:draw(self.imgBack, self.x, self.y)
		self.imgPrevious = self.imgBack
	elseif self.direction == 'right' then
		self.animate:draw(self.imgFront, self.x, self.y)
		self.imgPrevious = self.imgFront
	else
		self.animate:draw(self.imgPrevious, self.x, self.y)
	end
end

function Player:move()
	if love.keyboard.isDown('w') then
		self.y = self.y - WALK_SPEED
		self.direction = 'up'
	elseif love.keyboard.isDown('s') then
		self.y = self.y + WALK_SPEED
		self.direction = 'down'
	elseif love.keyboard.isDown('d') then
		self.x = self.x + WALK_SPEED
		self.direction = 'right'
	elseif love.keyboard.isDown('a') then
		self.x = self.x - WALK_SPEED
		self.direction = 'left'
	else
		self.direction = nil
	end
	camera:move(self.x, self.y)  
end

function Player:becomeDemon()
end

function Player:isDemon()
end

function Player:becomeHuman()
end
