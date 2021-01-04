local numbers = {}
for line in io.lines("day1/day1.txt") do 
    table.insert( numbers, line )
end

function checkSumRecursive(list,compareIndex,total,level,compareNumber)
    local index = compareIndex
    -- print(index)
    while index <= #list do 
        -- print(compareNumber+list[index])
        --higher level
        if level > 0 then
            --add comparenumber to current number
            -- print("level",level,index)
            local sumFound,total = checkSumRecursive(list,index+1,total,level-1,compareNumber + list[index])
            if sumFound then
                table.insert(total,list[index])
                return true, total
            end
        else
            -- if compare number + index number = total, return true
            if compareNumber + list[index] == total then 
                -- print("found sum")
                return true, {list[index]}
            end
            -- print("level",0, index)
        end
        index = index + 1
    end
    return false
end

function findSum(list,total)
    for index = 1, #list do
        -- print(index)
        local sumFound,total = checkSumRecursive(list,index+1,total,1,list[index])
        -- print(sumFound)
        if sumFound then 
            return total[1],total[2],list[index]
        end
    end
    return nil
end

local temporary2 = {1,2,3,4}
local temporary1 = {1721,979,366,299,675,1456}

local a,b,c = findSum(numbers,2020)
print("found",a,b,c)
print(a*b*c)
--checkSumRecursive(numbers,2,2020,1,numbers[1])