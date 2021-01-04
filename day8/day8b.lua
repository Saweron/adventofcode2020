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
    if instruction == "acc" then
        return head+1,total+number
    elseif instruction == "jmp" then
        return head+number,total
    elseif instruction == "nop" then
        return head+1,total
    end
end

function replaceCommand(text,newCommand)
    local replace = string.sub(text,4,string.len(text))
    return newCommand .. replace
end

function execute(commands)
    local total = 0 
    local head = 1
    local visitedLines = {}
    while true do 
        head, total = executeCommand(commands[head],head,total)
        if visitedLines[head] then return false end
        if head > #commands then return true,total end
        visitedLines[head] = true
    end
end

function copy(source)
    local new = {}
    for i, item in ipairs(source) do
        table.insert(new,item)
    end
    return new
end

function testAlternatives(commands)
    for i, item in ipairs(commands) do
        local thing = parseCommand(item)
        if thing ~= "acc" then
            local alternateProgram = copy(commands)
            if thing == "jmp" then 
                alternateProgram[i] = replaceCommand(alternateProgram[i],"nop")
            elseif thing == "nop" then
                alternateProgram[i] = replaceCommand(alternateProgram[i],"jmp")
            end
            local successful, result = execute(alternateProgram)
            if successful then return result end
        end
    end
end

print(testAlternatives(numbers))