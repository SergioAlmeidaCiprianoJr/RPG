Weapon = {}
Weapon.__index = Weapon

function Weapon:new(x, y, name, img, w, h)
    self = setmetatable({}, Weapon)

    self:change(x, y, name, img, w, h)

    return self
end

function Weapon:update(dt)
    self.animate:update(dt)
end

function Weapon:draw()
    local x, y = player:position()
    self.animate:draw(self.img, x+player.width, y)
end

function Weapon:change(x, y, name, img, w, h)
    self.name = name
    self.img = love.graphics.newImage(img)
    self.grid = anim8.newGrid(w, h, self.img:getWidth(), self.img:getHeight(), 0, 0, 0)
    self.animate = anim8.newAnimation(self.grid('1-4', 1), 0.1)
    self.collider = world:newRectangleCollider(x, y, w, h)
end