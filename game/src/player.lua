Player = setmetatable({}, Character)

-- Const
local WALK_SPEED = 7
local MAX_LIFE = 0

function Player:new(x, y, name, imgFront, imgBack)
	-- Variables
	self.name = name
	self.level = 1
	self.life = MAX_LIFE
	self.numberSpells = 0
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

function Player:camera()
end

function Player:becomeDemon()
end

function Player:isMonster()
end

function Player:becomeHuman()
end
