local numbers = {}
for line in io.lines("day10/day10.txt") do 
    table.insert( numbers, tonumber(line) )
end

local temp = {}
for line in io.lines("day10/day10demo.txt") do 
    table.insert( temp, tonumber(line) )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function countDifferences(list)
    local last = 0
    local d1 = 0
    local d3 = 1
    for i, item in ipairs(list) do
        local diff = item - last
        last = item
        if diff == 1 then
            d1 = d1 + 1
        elseif diff == 3 then
            d3 = d3 + 1
        end
    end
    return d1,d3
end

table.sort(numbers)
a,b = countDifferences(numbers)
print(a*b)

