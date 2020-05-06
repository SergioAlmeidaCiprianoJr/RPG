Weapon = {}
Weapon.__index = Weapon

-- CONST
local FRAME = 25

function Weapon:new(x, y, name, img, w, h)
    self = setmetatable({}, Weapon)

    self:change(x, y, name, img, w, h)

    return self
end

function Weapon:update(dt)
    self:attack()
    self.animate:update(dt)
end

function Weapon:draw()
    if self.count > 0 then
        local x, y = player:position()
        self.animate:draw(self.img, x+player.width, y-20)
        self.count = self.count - 1
    end
end

function Weapon:change(x, y, name, img, w, h)
    self.name = name
    self.count = 0
    self.img = love.graphics.newImage(img)
    self.grid = anim8.newGrid(w, h, self.img:getWidth(), self.img:getHeight(), 0, 0, 0)
    self.animate = anim8.newAnimation(self.grid('1-4', 1), 0.1)
    self.collider = world:newRectangleCollider(x, y, w, h)
end

function Weapon:attack()
    if love.keyboard.isDown('k') then
        self.count = FRAME
        self.animate:gotoFrame(1)
    end
end