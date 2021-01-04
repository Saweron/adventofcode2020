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

function updatePos(x,y,r,action)
    local i,value = string.match(action,"(%D)(%d+)")
    -- print(i,value)

    if i == "N" then
        return x,y+value,r
    elseif i == "S" then
        return x,y+(0-value),r
    elseif i == "E" then
        return x+value,y,r
    elseif i == "W" then
        return x+(0-value),y,r
    elseif i == "L" then
        return x,y,(r+(0-value))%360
    elseif i == "R" then
        return x,y,(r+(value))%360
    elseif i == "F" then
        if r==0 then
            return x,y+value,r
        elseif r==90 then
            return x+value,y,r
        elseif r==180 then
            return x,y+(0-value),r
        elseif r==270  then
            return x+(0-value),y,r
        end
    end
end

function runActions(list)
    local x,y,r = 0,0,90
    for i, item in ipairs(list) do
        x,y,r = updatePos(x,y,r,item)
        -- print(x,y,r)
    end
    return math.abs(x)+math.abs(y)
end

-- print(updatePos(0,0,90,"F10"))
print(runActions(numbers))