local numbers = {}
for line in io.lines("day18/day18.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day18/day18demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

--if opening parentheses then parse 

function isDigit(input)
    if string.match(input,"%d") then return true end
    return false
end

function operation(a,b,o)
    if o == "+" then return a+b
    elseif o == "-" then return a-b
    elseif o == "*" then return a*b
    elseif o == "/" then return a/b
    end
end

function parse(input)
    local finished = false
    local total
    local operator
    local operatee = ""
    local last = ""
    local i = 1
    local len = string.len(input)

    while i <= len do 
        local c = string.sub(input,i,i)
        if c=="*" or c=="+" or c=="-" or c=="/" then
            operator = c
            last = "operator"
        elseif isDigit(c) then
            operatee = operatee .. c
            last = "number"
        elseif c=="(" then
            last = "recursive"
        end
        if c==" " or i>=len then
            if last == "number" then
                if not total then total = tonumber(operatee)
                else total = operation(total,tonumber(operatee),operator) end
                print(operatee,total)
            end
            operatee = ""
            print(last)
        end
        -- print(c,i)
        i = i + 1
    end
    return total,i
end

print(parse("12 + 2 + 3 + 4"))