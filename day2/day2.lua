local numbers = {}
for line in io.lines("day2/day2.txt") do 
    table.insert( numbers, line )
end


function checkValidity(inputstring)
    local min,max,letter,comparestring = string.match(inputstring,"(%d*)[-](%d*) (%a): (%a*)")
    local charcount = 0
    for i=1, string.len(comparestring) do
        if string.sub(comparestring,i,i) == letter then
            charcount = charcount + 1
            if charcount > tonumber(max) then return false end
        end
    end
    if charcount < tonumber(min) then return false else return true end
end

function countValidity(list)
    local count = 0
    for i, check in pairs(list) do
        if checkValidity(check) then count = count + 1 end
    end
    return count
end

local temporary = {"1-3 a: abcde","1-3 b: cdefg","2-9 c: ccccccccc"}

-- print(checkValidity("6-7 t: ttrtltxt"))
print(countValidity(numbers))