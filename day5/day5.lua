local numbers = {}
for line in io.lines("day5/day5.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day5/day5demo.txt") do 
    table.insert( temp, line )
end

function determineBinaryPosition(binary,initialAmmount)
    local jumpAmmount = initialAmmount/2
    local headPosition = 0
    for index = 1, string.len(binary) do
        if string.sub(binary,index,index) == "B" or string.sub(binary,index,index) == "R" then
            headPosition = headPosition + jumpAmmount
        end
        jumpAmmount = jumpAmmount / 2
    end
    return headPosition
end

function determineSeatPos(pattern)
    local x = determineBinaryPosition(string.sub(pattern,1,7),128)
    local y = determineBinaryPosition(string.sub(pattern,8,10),8)
    return x,y
end

function findHighestSeatID(seats)
    local maxID = 0
    for i, seat in ipairs(seats) do
        local x,y = determineSeatPos(seat)
        local id = x*8+y
        -- print(x,y,id)
        if id > maxID then
            maxID = id
        end
    end
    return maxID
end

print(findHighestSeatID(numbers))

