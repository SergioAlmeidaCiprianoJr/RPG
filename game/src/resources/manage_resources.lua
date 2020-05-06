function loadResources()
    -- World add collision mecanics
    world = wf.newWorld()

    -- Creating Player
    loadPlayer()

    -- Creating Weapons
    loadWeapons()
    
    -- Loading all maps
    loadBattlefield()
end

function updateResources(dt)
	world:update(dt)
    player:update(dt)
    weapon:update(dt)
end

function drawResources()
	camera:set()
	mapBattlefield:draw()
    player:draw()
    weapon:draw()
	world:draw()
	camera:unset()
end

function loadCollisionClass()
    world:addCollisionClass('Solid')
    world:addCollisionClass('Ghost', {ignores = {'Solid'}})
end

function loadPlayer()
    playerImg = {right = '/pixel_art/protagonist/demon_warrior_grid.png', left = '/pixel_art/protagonist/demon_warrior_grid_iv.png'}
    player = Player:new(500, 500, 'Sergio', playerImg.right, playerImg.left)
end

function loadWeapons()
    weapon = Weapon:new(500, 500, 'sword', '/pixel_art/weapons/katana_animation_grid.png', 31*4, 40*4)
end

function loadBattlefield()
    collision = {
        l1 = {32,   159,  2008, 159},       -- top
        l2 = {32,   1888, 2008, 1888},      -- bottom
        l3 = {32,   159,  32,   1888},      -- left
        l4 = {2008, 159,  2008, 1888}       -- right
    }

    mapBattlefield = Map:new('battefield', '/pixel_art/scenario/battlefield.png', collision)
end
