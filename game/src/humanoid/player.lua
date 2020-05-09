Player = {}
Player.__index = Player

-- Const
local WALK_SPEED = 400
local MAX_LIFE = 100

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
	self.width, self.height = 125, 148
	self.grid = anim8.newGrid(self.width, self.height, self.imgFront:getWidth(), self.imgFront:getHeight(), 0, 0, 8)

	-- Animation
	self.animate = anim8.newAnimation(self.grid('1-3',1), 0.1)

	-- Collider
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
	local x, y = self:position()
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
	local vectorX, vectorY = 0, 0
	-- Here we need to use ifs insteed of elseifs because we want to move in diagonal
	-- and without elseif the movement is more fluid
	if love.keyboard.isDown('w') then
		vectorY = -1
	end
	if love.keyboard.isDown('s') then
		vectorY = 1
	end
	if love.keyboard.isDown('d') then
		vectorX = 1
		self.direction = 'right'
	end
	if love.keyboard.isDown('a') then
		vectorX = -1
		self.direction = 'left'
	end
	if love.keyboard.isDown('w') == false
	   and love.keyboard.isDown('s') == false
	   and love.keyboard.isDown('d') == false
	   and love.keyboard.isDown('a') == false
	then
		self.direction = nil
	end
	self.collider:setLinearVelocity(vectorX*WALK_SPEED, vectorY*WALK_SPEED)
	local x, y = self:position()
	camera:move(x, y)
end

function Player:position()
	-- fix x and y provided by self.collider
	-- getPosition gives rectangle's center x and y
	local x, y = self.collider:getPosition()
	return x-self.box.w/2, y-self.box.h/2-110
end

function Player:becomeDemon()
end

function Player:isDemon()
end

function Player:becomeHuman()
end