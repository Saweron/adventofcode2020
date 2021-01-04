local numbers = {}
for line in io.lines("day8/day8.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day8/day8demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function parseCommand(command)
    return string.match(command,"(%a%a%a)%s([+-])(%d+)") 
end

function executeCommand(command,head,total)
    local instruction,sign,number = parseCommand(command)
    if sign == "-" then number = 0-number end
    print(instruction,number)
    if instruction == "acc" then
        return head+1,total+number
    elseif instruction == "jmp" then
        return head+number,total
    elseif instruction == "nop" then
        return head+1,total
    end
end

function execute(commands)
    local total = 0 
    local head = 1
    local visitedLines = {}
    while true do 
        head, total = executeCommand(commands[head],head,total)
        if visitedLines[head] then return total end
        visitedLines[head] = true
    end
    return total
end

print(execute(numbers))