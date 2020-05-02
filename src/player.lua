Player = {}
Player.__index = Player

-- Const
local WALK_SPEED = 0
local RUN_SPEED = 0
local MAX_LIFE = 0

function Player:new(x,y,name)
	local	self = setmetatable({}, Player)
	
	-- Variables
	self.name = name
	self.level = 1
	self.life = MAX_LIFE
	self.numberSpells = 0
	self.x, self.y = x, y

	-- Image
	self.imgFront = love.graphics.newImage('pixel_art/protagonist/player_front.png')
	self.imgBack = love.graphics.newImage('pixel_art/protagonist/player_back.png')

	-- Grid
	self.gridFront = anim8.newGrid(35, 64, self.imgFront:getWidth(), self.imgFront:getHeight(), 0, 0, 2)
	self.gridBack = anim8.newGrid(35, 64, self.imgBack:getWidth(), self.imgBack:getHeight(), 0, 0, 2)

	-- Animation
	self.animateFront = anim8.newAnimation(self.gridFront('1-5',1), 0.1)
	self.animateBack = anim8.newAnimation(self.gridBack('1-5',1), 0.1)

	return self
end

function Player:update(dt)
	self.animateFront:update(dt)
	--self.animateBack:update(dt)
end

function Player:draw()
	self.animateFront:draw(self.imgFront, self.x, self.y)
	--self.animateBack:draw(self.imgBack, self.x, self.y)
end
