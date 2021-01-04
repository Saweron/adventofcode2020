local numbers = {}
for line in io.lines("day1/day1.txt") do 
    table.insert( numbers, line )
end
-- print(numbers[2])

function findSum(list,number)
    print("list length:", #list)
    for indexA = 1, #list do
        local numberA = list[indexA]
        local indexB = indexA + 1

        while indexB <= #list do
            -- print("index A", indexA, "index B", indexB)

            local numberB = list[indexB]
            if numberB + numberA == number then
                print("found number", indexA, "plus", indexB)
                print("numbers are",numberA,numberB)
                return numberB, numberA
            end
            
            indexB = indexB + 1
        end
    end
    return 0,0
end

local temporary = {1721,979,366,299,675,1456}

-- print(findSum(temporary, 2020))
local a,b = findSum(numbers, 2020)
print(a*b)