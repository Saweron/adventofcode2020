local numbers = {}
for line in io.lines("day7/day7.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day7/day7demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function removeSpace(string)
    local l = string.len(string)
    if string.sub(string,l,l) == " " then
        -- print("space")
        return string.sub(string,1,l-1)
    end
end

function parseInput(line)
    local parentBag,childBags = string.match(line,"(.+) bags contain (.+)")
    local bagTable = {}
    if childBags == "no other bags." then
        return parentBag,false
    end
    childBags = string.gsub(childBags,"bags","")
    childBags = string.gsub(childBags,"bag","")
    local processedText = ""
    for a,b in string.gmatch(childBags,"(%d+)%s(.-),") do
        processedText = processedText .. a .. " " .. b .. ", "
        table.insert(bagTable,{name=removeSpace(b),quantity=a})
    end
    childBags = string.gsub(childBags,processedText,"")
    local a,b = string.match(childBags,"(%d+)%s(.-).$")
    table.insert(bagTable,{name=removeSpace(b),quantity=a})
    return parentBag, bagTable
end

function parseInputs(list)
    local parsed = {}
    for i, item in ipairs(list) do
        local key,value = parseInput(item)
        parsed[key] = value
    end
    return parsed
end

function checkForBag(checkItem,checkValue,table)
    local checkList
    if type(checkItem) == "string" then
        checkList = table[checkItem]
    elseif type(checkItem) == "table" then
        checkList = checkItem
    end
    if checkList then
        for i, item in pairs(checkList) do
            if item.name == checkValue then
                 return true
            elseif checkForBag(item.name,checkValue,table) then
                return true
            end
        end
        return false
    else return false end
end

function checkForBags(table,checkValue)
    local total = 0
    for i, item in pairs(table) do
        print(item)
        if checkForBag(item,checkValue,table) then total = total + 1 end
    end
    return total
end

output = parseInputs(numbers)
-- printList(output)
-- print(checkForBag(output["bright white"],"shiny gold",output))
print(checkForBags(output,"shiny gold"))

