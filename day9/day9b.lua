local numbers = {}
for line in io.lines("day9/day9.txt") do 
    table.insert( numbers, tonumber(line) )
end

local temp = {}
for line in io.lines("day9/day9demo.txt") do 
    table.insert( temp, tonumber(line) )
end

function findSum(list,number)
    for indexA = 1, #list do
        local numberA = list[indexA]
        local indexB = indexA + 1
        while indexB <= #list do
            local numberB = list[indexB]
            local sum = numberB+numberA
            if sum == number then
                return true
            end
            indexB = indexB + 1
        end
    end
    return false
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function validateSum(number,preamble)
    if findSum(preamble,number) then return true end
    return false
end

function getPreamble(pos,list,length)
    local preamble = {}
    local start =  pos-length
    if start < 1 then start = 1 end
    for i=start,start+length-1 do 
        table.insert(preamble,list[i])
    end
    return preamble
end


function validateNumbers(list,length)
    for i, item in ipairs(list) do
        if i > length then
            pre = getPreamble(i,list,length)
            if not validateSum(item,pre) then return item end
        end
    end
end

function tryContiguous(index,list,number)
    local total = list[index]
    local numbers = {total}
    local i = index
    while total < number do 
        i = i + 1
        total = total + list[i]
        table.insert(numbers,list[i])
        if total == number then return numbers end
    end
    return false
end

function findContiguous(number,list)
    for i, item in ipairs(list) do
        local result = tryContiguous(i,list,number)
        if result then
            table.sort(result)
            -- print(result[1],result[#result]) 
            return result[1] + result[#result]
        end
    end
end

-- printList(tryContiguous(3,temp,127))
local tryTotal = validateNumbers(numbers,25)
print(findContiguous(tryTotal,numbers))
