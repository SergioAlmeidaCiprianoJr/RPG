Weapon = {}
Weapon.__index = Weapon

-- CONST
local FRAME = 25
local INF = -100000

function Weapon:new(x, y, name, imgL, imgR, w, h)
    self = setmetatable({}, Weapon)

    self:change(x, y, name, imgL, imgR, w, h)

    return self
end

function Weapon:update(dt)
    self:attack()
    self.animate:update(dt)
end

function Weapon:draw()
    local x, y = player:position()
    local img, animW, animH = nil
    
    -- alternating between the animation of the weapon depending on the player's direction
    if player.direction == 'left' then
        img, animW, animH = self:changeAnimation('left', x-player.width, y-20)
    elseif player.direction == 'right' then
        img, animW, animH = self:changeAnimation('right', x+player.width, y-20)
    else
        if self.previousAnim == 'left' then img, animW, animH = self:changeAnimation(self.previousAnim, x-player.width, y-20)
        else img, animW, animH = self:changeAnimation(self.previousAnim, x+player.width, y-20) end
    end
    
    if self.count > 0 then
        -- drawing attack
        self.animate:draw(img, animW, animH)
        self.collider:setPosition(self.posCollider.x, self.posCollider.y)
        self.count = self.count - 1
    else
        -- taking hitbox off the screen when not attacking
        self.collider:setPosition(INF, INF)
        -- keeping the weapon next to the character
        self.animate:gotoFrame(1)
        self.animate:draw(img, animW, animH)
        -- keeping the attack on the right side
        if player.direction == 'left' then self.previousAnim = 'left'
        elseif player.direction == 'right' then self.previousAnim = 'right'
        end
    end
end

function Weapon:change(x, y, name, imgL, imgR, w, h)
    self.name = name
    self.count = 0
    self.imgL = love.graphics.newImage(imgL)
    self.imgR = love.graphics.newImage(imgR)
    self.grid = anim8.newGrid(w, h, self.imgL:getWidth(), self.imgL:getHeight(), 0, 0, 0)
    self.animate = anim8.newAnimation(self.grid('1-4', 1), 0.1)
    self.previousAnim = nil
    self.collider = world:newRectangleCollider(INF, INF, w, h)
    self.posCollider = { x,y = nil }
end

function Weapon:attack()
    if love.keyboard.isDown('j') and self.count == 0 then
        self.count = FRAME
        self.animate:gotoFrame(1)
    end
end

function Weapon:changeAnimation(direction, x, y)
    if direction == 'left' then
        img = self.imgL
    else
        img = self.imgR
    end
    
    animW, animH = x, y
    self.previousAnim = direction
    self.posCollider.x, self.posCollider.y = x + player.box.w/2, y + 2*player.box.h

    return img, animW, animH
end