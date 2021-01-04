local numbers = {}
for line in io.lines("day14/day14.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day14/day14demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function populate(thing,length)
    local result = {}
    for i=1, length do
        table.insert(result,thing)
    end
    return result
end

function makeString(list)
    local result = ""
    for i, item in ipairs(list) do
        result = result .. item
    end
    return result
end

function getMask(mask)
    local mask1 = populate("0",string.len(mask))
    local mask0 = populate("1",string.len(mask))
    for i=1,string.len(mask) do
        item = string.sub(mask,i,i)
        if item == "1" then
            mask1[i] = "1"
        elseif item =="0" then
            mask0[i] = "0"
        end
    end
    return makeString(mask1),makeString(mask0)
end


function fromBinary(binary)
    local multiplier = 1
    local number = 0
    local l = string.len(binary)
    for i=1,l do
        if string.sub(binary,l-i+1,l-i+1) == "1" then number = number + multiplier end
        if multiplier == 1 then multiplier = 2 else multiplier = multiplier * 2 end
    end
    return number
end

function calculate(list)
    local a,b
    local memory = {}
    for i, item in ipairs(list) do
        if string.match(item,"mask") then
            local m = string.match(item,"mask = (.+)")
            a,b = getMask(m)
            a,b = fromBinary(a),fromBinary(b)
        else 
            local adr,n = string.match(item,"mem%[(%d+)%] = (.+)")
            memory[adr] = (tonumber(n)|a)&b
        end
    end
    return memory
end

function sumList(list)
    local total = 0
    for i, item in pairs(list) do 
        total = total + item 
    end
    return total
end

local r = calculate(numbers)
printList(r)
print("~~~")
print(sumList(r))
-- local a,b = getMask("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X")
-- a,b = fromBinary(a),fromBinary(b)
-- print(a,b)
-- print((0|a)&b)



-- 0 = and
-- 1 = or

--have 2 masks
--

