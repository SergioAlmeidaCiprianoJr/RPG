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

	-- Image
	self.imgFront = love.graphics.newImage(imgFront)
	self.imgBack = love.graphics.newImage(imgBack)
	self.imgPrevious = self.imgFront

	-- Grid
	self.grid = anim8.newGrid(125, 148, self.imgFront:getWidth(), self.imgFront:getHeight(), 0, 0, 8)

	-- Animation
	self.animate = anim8.newAnimation(self.grid('1-3',1), 0.1)

	-- Collider Map
	self.box = {w = 120, h = 40} -- width and height
	self.collider = world:newRectangleCollider(x, y, self.box.w, self.box.h) -- creating box for legs 

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
	local x, y = self:fixPosition(self.collider:getPosition())
	if self.direction == 'left' then
		self.animate:draw(self.imgBack, x, y)
		self.imgPrevious = self.imgBack
	elseif self.direction == 'right' then
		self.animate:draw(self.imgFront, x, y)
		self.imgPrevious = self.imgFront
	else
		self.animate:draw(self.imgPrevious, x, y)
	end
end

function Player:move()
	local x, y = self.collider:getPosition()

	if love.keyboard.isDown('w') then
		y = y - WALK_SPEED
		self.direction = 'up'
	elseif love.keyboard.isDown('s') then
		y = y + WALK_SPEED
		self.direction = 'down'
	elseif love.keyboard.isDown('d') then
		x = x + WALK_SPEED
		self.direction = 'right'
	elseif love.keyboard.isDown('a') then
		x = x - WALK_SPEED
		self.direction = 'left'
	else
		self.direction = nil
	end

	self.collider:setPosition(x, y)
	camera:move(x, y)  
end

function Player:fixPosition(x, y)
	-- fix x and y provided by self.collider
	-- getPosition gives rectangle's center (x and y)
	-- 110 fix height, so that the box is on the legs
	return x-self.box.w/2, y-self.box.h/2-110
end

function Player:becomeDemon()
end

function Player:isDemon()
end

function Player:becomeHuman()
end