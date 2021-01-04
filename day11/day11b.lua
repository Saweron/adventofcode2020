local numbers = {}
for line in io.lines("day11/day11.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day11/day11demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function replaceCharacter(string,character,new)
    a = string.sub(string,1,character-1)
    b = string.sub(string,character+1,string.len(string))
    return a .. new .. b
end

function copy(list)
    local new = {}
    for i, item in ipairs(list) do
        table.insert(new,item)
    end
    return new
end

function getTile(list,x,y)
    if list[y] then
        if x < 1 or x > string.len(list[y]) then return false end
        return string.sub(list[y],x,x)
    end
    return false 
end

function replaceTile(list,x,y,new)
    if list[y] then
        if x < 1 or x > string.len(list[y]) then return end
        list[y] = replaceCharacter(list[y],x,new)
    end
end

function lineOfSight(list,x,y,dx,dy)
    local px,py = x,y 
    local bx = string.len(list[1])
    local by = #list
    while true do 
        px = px+dx
        py = py+dy
        local tile = getTile(list,px,py)
        if tile == "L" or tile == "#" then return tile end
        if px < 1 or py < 1 or px > bx or py > by then return false end
    end
end

printList(temp)
print(lineOfSight(temp,1,1,1,0))


function simulateTile(tile,surrounding)
    local occupied = 0
    for i, item in ipairs(surrounding) do
        if item == "#" then occupied = occupied + 1 end
    end
    if tile then 
        if tile == "." then return tile 
        elseif tile == "L" then
            if occupied == 0 then
                return "#", true
            end
        elseif tile == "#" then
            if occupied >= 5 then
                return "L", true
            end
        end
    end
    return tile, false
end

function simulate(grid)
    local newGrid = copy(grid)
    local occupiedCount = 0
    local changed = false
    for y, item in ipairs(grid) do
        for x=1, string.len(item) do
            local surrounding = {}

            -- table.insert(surrounding,getTile(grid,x+1,y-1))
            -- table.insert(surrounding,getTile(grid,x+1,y))
            -- table.insert(surrounding,getTile(grid,x+1,y+1))

            -- table.insert(surrounding,getTile(grid,x-1,y-1))
            -- table.insert(surrounding,getTile(grid,x-1,y))
            -- table.insert(surrounding,getTile(grid,x-1,y+1))

            -- table.insert(surrounding,getTile(grid,x,y+1))
            -- table.insert(surrounding,getTile(grid,x,y-1))
            
            table.insert(surrounding,lineOfSight(grid,x,y,1,-1))
            table.insert(surrounding,lineOfSight(grid,x,y,1,0))
            table.insert(surrounding,lineOfSight(grid,x,y,1,1))

            table.insert(surrounding,lineOfSight(grid,x,y,-1,-1))
            table.insert(surrounding,lineOfSight(grid,x,y,-1,0))
            table.insert(surrounding,lineOfSight(grid,x,y,-1,1))

            table.insert(surrounding,lineOfSight(grid,x,y,0,1))
            table.insert(surrounding,lineOfSight(grid,x,y,0,-1))


            local new, altered = simulateTile(getTile(grid,x,y),surrounding)
            replaceTile(newGrid,x,y,new)
            if new == "#" then occupiedCount = occupiedCount + 1 end
            if altered then changed = altered end
            -- print("~~~")
            -- printList(surrounding)
        end
    end
    return newGrid,occupiedCount,changed
end

function simulateUntilStable(grid)
    local newGrid = copy(grid)
    while true do
        local occupiedCount,changed
        newGrid,occupiedCount,changed = simulate(newGrid)
        -- printList(newGrid)
        -- print(occupiedCount,changed)
        -- print("~~~")
        if not changed then return occupiedCount end
    end
end

print(simulateUntilStable(numbers))
-- printList(temp)
-- temp = simulate(temp)
-- print("~~~")
-- printList(temp)

-- temp = simulate(temp)
-- print("~~~")
-- printList(temp)
