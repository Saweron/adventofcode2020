local numbers = {}
for line in io.lines("day9/day9.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day9/day9demo.txt") do 
    table.insert( temp, line )
end

function findSum(list,number)
    -- print(number)
    for indexA = 1, #list do
        local numberA = list[indexA]
        local indexB = indexA + 1
        while indexB <= #list do
            local numberB = list[indexB]
            local sum = numberB+numberA
            -- print(numberB,numberA,sum,number)
            if math.floor(sum) == math.floor(number) then
                -- print("yes")
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
            -- print("~~~")
            -- print(item)
            -- printList(pre)
            -- print(findSum(pre,item))
            if not validateSum(item,pre) then return item end
        end
    end
end

-- pre = getPreamble(1,temp,5)
-- print(validateSum(40,pre))
print(validateNumbers(numbers,25))