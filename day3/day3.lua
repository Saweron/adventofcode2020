local numbers = {}
for line in io.lines("day3/day3.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day3/day3demo.txt") do 
    table.insert( temp, line )
end

function getTile(list,x,y)
    local wX = ((x-1)%string.len(list[1]))+1
    if list[y] then
    return string.sub(list[y],wX,wX)
    end
end

function getTreeIntersections(list,iX,iY,dX,dY)
    local y = iY
    local x = iX
    local totalTrees = 0
    while y <= #list do 
        -- print(y)
        y = y + dY
        x = x + dX
        if getTile(list,x,y) == "#" then
            totalTrees = totalTrees + 1
            -- print("TREE", totalTrees)
        end
    end
    return totalTrees
end

-- print(temp[1])
-- print(getTile(temp,12,1))
print(getTreeIntersections(numbers,1,1,3,1))