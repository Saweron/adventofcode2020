local numbers = "19,0,5,1,10,13"

local temp = "0,3,6"

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function copy(list)
    local new = {}
    for i, item in ipairs(list) do
        table.insert(new,item)
    end
    return new
end

function split(input)
    local all = ""
    local output = {}
    for item in string.gmatch(input,"(.-),") do
        all = all .. item .. ","
        table.insert(output,item)
    end
    local s = string.gsub(input,all,"")
    table.insert(output,s)
    return output
end

function nextTick(memory,lastSpoken,turn)
    if memory[lastSpoken] then
        local newMem = copy(memory)
        newMem[lastSpoken] = turn-1 
        print("bbb",turn-memory[lastSpoken])
        return newMem,turn-memory[lastSpoken]-1
    else
        --if previous was new
        print("previous was new")
        local newMem = copy(memory)
        newMem[0] = turn 
        return newMem,0
    end
end

function calculate(input,ticks)
    local inputs = split(input)
    local memory = {}
    for i, item in ipairs(inputs) do
        memory[item] = false
    end

    local currentTick = #inputs+1
    local newMem, current = nextTick(memory,inputs[#inputs],currentTick)
    local lastSpoken = current
    print("~~~")
    print(currentTick, current)
    printList(newMem)
    currentTick = currentTick + 1

    while currentTick < ticks do
        lastSpoken = current
        newMem, current = nextTick(newMem,lastSpoken,currentTick)

        print("~~~")
        print(currentTick, current)
        printList(newMem)
        currentTick = currentTick + 1
    end
end

calculate(temp,8)