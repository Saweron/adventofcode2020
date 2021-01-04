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

function find(thing,list)
    for i, item in ipairs(list) do
        if item == thing then return i end
    end
end

function getBranches(number,list)
    index = find(number,list)
    local branches = {}
    if index == #list then return branches end
    if list[index+1] and list[index+1] - number <= 3 then table.insert(branches,list[index+1]) end
    if list[index+2] and list[index+2] - number <= 3 then table.insert(branches,list[index+2]) end
    if list[index+3] and list[index+3] - number <= 3 then table.insert(branches,list[index+3]) end
    return branches
end

function getRecursivePScore(number,list)
    local branches = getBranches(number,list)
    local score = 0
    if #branches == 1 then return 1 end
    for i, item in ipairs(branches) do
        if #getBranches(item,list) > 1 then 
            score = score + getRecursivePScore(item,list)
        else 
            score = score + 1
            alreadyCalculated[item] = true
        end
    end
    alreadyCalculated[number] = true
    return score
end

--miscalculating 17's p score as 7, should be 4 instead 

--problem is here
function getLowLevelPScores(list)
    local total = 0
    for i, item in ipairs(list) do
        if not alreadyCalculated[item] then
            score = getRecursivePScore(item,list)
            if total == 0 then total = score 
            else
                total = total * score
            end
            print(item,score,total)
        end
    end
    return total 
end

alreadyCalculated = {}
table.sort(temp)
printList(temp)
-- print(find(33,temp))
-- printList(getBranches(14,temp))
-- print(getRecursivePScore(17,temp))
-- printList(alreadyCalculated)
print(getLowLevelPScores(temp))
-- a,b = countDifferences(temp)
-- print(a*b)

