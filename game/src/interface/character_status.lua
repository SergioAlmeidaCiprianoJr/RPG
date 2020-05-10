local imgLife, imgLifeDamaged, imgLifeEmpty

function loadLife(life, lifeDamaged, lifeEmpty)
    imgLife = love.graphics.newImage(life)
    imgLifeDamaged = love.graphics.newImage(lifeDamaged)
    imgLifeEmpty = love.graphics.newImage(lifeEmpty)
end

function drawLife(life, lifeDamaged, lifeEmpty, imgSize, posX, posY)
    local i

    for i = life, 1, -1 do
        love.graphics.draw(imgLife, posX, posY)
        posX = posX+75
    end

    for i = lifeDamaged, 1, -1 do
        love.graphics.draw(imgLifeDamaged, posX, posY)
        posX = posX+75
    end

    for i = lifeEmpty, 1, -1 do
        love.graphics.draw(imgLifeEmpty, posX, posY)
        posX = posX+75
    end
end