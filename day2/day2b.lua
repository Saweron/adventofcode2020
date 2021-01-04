local numbers = {}
for line in io.lines("day2/day2.txt") do 
    table.insert( numbers, line )
end

function xor(a,b)
    return ((a and not b) or (not a and b))
end

function checkValidity(inputstring)
    local min,max,letter,comparestring = string.match(inputstring,"(%d*)[-](%d*) (%a): (%a*)")
    return xor(string.sub(comparestring,min,min) == letter, string.sub(comparestring,max,max) == letter)
end

function countValidity(list)
    local count = 0
    for i, check in pairs(list) do
        if checkValidity(check) then count = count + 1 end
    end
    return count
end

print(countValidity(numbers))