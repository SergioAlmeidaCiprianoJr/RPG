Weapon = {}
Weapon.__index = Weapon

-- CONST
local FRAME = 25

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

    if player.direction == 'left' then
        img, animW, animH = self:changeAnimation('left', x-player.width, y-20)
    elseif player.direction == 'right' then
        img, animW, animH = self:changeAnimation('right', x+player.width, y-20)
    else
        if self.previousAnim == 'left' then img, animW, animH = self:changeAnimation(self.previousAnim, x-player.width, y-20)
        else img, animW, animH = self:changeAnimation(self.previousAnim, x+player.width, y-20) end
    end
    
    if self.count > 0 then
        self.animate:draw(img, animW, animH)
        self.count = self.count - 1
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
    --self.collider = world:newRectangleCollider(x, y, w, h)
end

function Weapon:attack()
    if love.keyboard.isDown('k') and self.count == 0 then
        self.count = FRAME
        self.animate:gotoFrame(1)
    end
end

function Weapon:changeAnimation(direction, x, y)
    if direction == 'left' then img = self.imgL
    else img = self.imgR end

    animW, animH = x, y
    self.previousAnim = direction

    return img, animW, animH
end