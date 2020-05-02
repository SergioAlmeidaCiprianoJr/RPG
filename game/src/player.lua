Player = {}
Player.__index = Player

-- Const
local WALK_SPEED = 3
local RUN_SPEED = 0
local MAX_LIFE = 0

function Player:new(x,y,name)
	local	self = setmetatable({}, Player)
	
	-- Variables
	self.name = name
	self.level = 1
	self.life = MAX_LIFE
	self.numberSpells = 0
	self.direction = 'L' -- N / S / L / O
	self.x, self.y = x, y

	-- Image
	self.imgFront = love.graphics.newImage('pixel_art/protagonist/player_front.png')
	self.imgBack = love.graphics.newImage('pixel_art/protagonist/player_back.png')
	self.imgLeft = love.graphics.newImage('pixel_art/protagonist/player_left_side.png')
	self.imgRight = love.graphics.newImage('pixel_art/protagonist/player_right_side.png')

	-- Grid
	self.gridFront = anim8.newGrid(35, 64, self.imgFront:getWidth(), self.imgFront:getHeight(), 0, 0, 2)
	self.gridBack = anim8.newGrid(35, 64, self.imgBack:getWidth(), self.imgBack:getHeight(), 0, 0, 2)
	self.gridLeft = anim8.newGrid(35, 64, self.imgLeft:getWidth(), self.imgLeft:getHeight(), 0, 0, 2)
	self.gridRight = anim8.newGrid(35, 64, self.imgRight:getWidth(), self.imgRight:getHeight(), 0, 0, 2)

	-- Animation
	self.animateFront = anim8.newAnimation(self.gridFront('1-5',1), 0.1)
	self.animateBack = anim8.newAnimation(self.gridBack('1-5',1), 0.1)
	self.animateLeft = anim8.newAnimation(self.gridLeft('1-5',1), 0.1)
	self.animateRight = anim8.newAnimation(self.gridRight('1-5',1), 0.1)

	return self
end

function Player:update(dt)
	self.animateFront:update(dt)
	self.animateBack:update(dt)
	self.animateLeft:update(dt)
	self.animateRight:update(dt)

	self:move()
end

function Player:draw()
	if self.direction == 'N' then
		self.animateBack:draw(self.imgBack, self.x, self.y)
	elseif self.direction == 'S' then
		self.animateFront:draw(self.imgFront, self.x, self.y)
	elseif self.direction == 'L' then
		self.animateRight:draw(self.imgRight, self.x, self.y)
	elseif self.direction == 'O' then
		self.animateLeft:draw(self.imgLeft, self.x, self.y)
	end
end

function Player:move()
	if love.keyboard.isDown('w') then
		self.y = self.y - WALK_SPEED
		self.direction = 'N'
	end
	if love.keyboard.isDown('s') then
		self.y = self.y + WALK_SPEED
		self.direction = 'S'
	end
	if love.keyboard.isDown('d') then
		self.x = self.x + WALK_SPEED
		self.direction = 'L'
	end
	if love.keyboard.isDown('a') then
		self.x = self.x - WALK_SPEED
		self.direction = 'O'
	end  
end
