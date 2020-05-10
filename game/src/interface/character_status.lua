Status = {}
Status.__index = Status

function Status:new(life, lifeDamaged, lifeEmpty)
    self = setmetatable({}, Status)

    self.imgLife = love.graphics.newImage(life)
    self.imgLifeDamaged = love.graphics.newImage(lifeDamaged)
    self.imgLifeEmpty = love.graphics.newImage(lifeEmpty)

    return self
end

function Status:drawLife(life, lifeDamaged, lifeEmpty, imgSize, posX, posY)
    local i

    for i = life, 1, -1 do
        love.graphics.draw(self.imgLife, posX, posY)
        posX = posX+75
    end

    for i = lifeDamaged, 1, -1 do
        love.graphics.draw(self.imgLifeDamaged, posX, posY)
        posX = posX+75
    end

    for i = lifeEmpty, 1, -1 do
        love.graphics.draw(self.imgLifeEmpty, posX, posY)
        posX = posX+75
    end
end