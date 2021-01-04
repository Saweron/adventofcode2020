local numbers = {}
for line in io.lines("day13/day13.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day13/day13demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function split(line)
    local residue = ""
    local outputs = {}
    for item in string.gmatch(line,"(.-),") do
        residue = residue .. item .. ","
        table.insert(outputs,item)
    end
    local n = string.gsub(line,residue,"")
    table.insert(outputs,n)
    return outputs
end
split("7,13,x,x,59,x,31,19")

function findTimeDelta(departure,m)
    local remainder = departure%m
    remainder = m - remainder
    return remainder
    -- print(remainder)
end

function findLowest(list,number)
    local lowest = 0
    local lowestId = 0
    for i, item in ipairs(list) do
        if item == "x" then else 
            del = findTimeDelta(number,item)
            -- print(item, del)
            if lowest == 0 then
                 lowest = del
                 lowestId = item
            elseif del < lowest then
                 lowest = del
                 lowestId = item
            end
        end
    end
    return lowest*lowestId
end

local list = split(numbers[2])
-- printList(list)
print(findLowest(list,numbers[1]))
-- findTimeDelta(939,19)