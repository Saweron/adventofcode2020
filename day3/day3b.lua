local numbers = {}
for line in io.lines("day3/day3.txt") do 
    table.insert( numbers, line )
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
        y = y + dY
        x = x + dX
        if getTile(list,x,y) == "#" then totalTrees = totalTrees + 1 end
    end
    return totalTrees
end

local a = getTreeIntersections(numbers,1,1,1,1)
local b = getTreeIntersections(numbers,1,1,3,1)
local c = getTreeIntersections(numbers,1,1,5,1)
local d = getTreeIntersections(numbers,1,1,7,1)
local e = getTreeIntersections(numbers,1,1,1,2)
print(a,b,c,d,e)
print(a*b*c*d*e)