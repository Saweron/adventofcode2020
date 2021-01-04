local numbers = {}
for line in io.lines("day12/day12.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day12/day12demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end
 
function rotate(x,y,r)
    if r==90 or r==-270 then return y,-x
    elseif r==180 or r==-180 then return -x,-y
    elseif r==270 or r==-90 then return -y,x
    end
end

function updatePos(bX,bY,sX,sY,action)
    local i,value = string.match(action,"(%D)(%d+)")
    if i == "N" then return bX,bY+value,sX,sY
    elseif i == "S" then return bX,bY-value,sX,sY
    elseif i == "E" then return bX+value,bY,sX,sY
    elseif i == "W" then return bX-value,bY,sX,sY
    elseif i == "L" then
        rX,rY = rotate(bX,bY,-tonumber(value))
        return rX,rY,sX,sY
    elseif i == "R" then
        rX,rY = rotate(bX,bY,tonumber(value))
        return rX,rY,sX,sY
    elseif i == "F" then return bX,bY,sX+bX*value,sY+bY*value end
end

function runActions(list)
    local bX,bY,sX,sY = 10,1,0,0
    for i, item in ipairs(list) do
        bX,bY,sX,sY = updatePos(bX,bY,sX,sY,item)
    end
    return math.abs(sX)+math.abs(sY)
end

print(runActions(numbers))