local numbers = {}
for line in io.lines("day4/day4.txt") do 
    table.insert( numbers, line )
end

function combinePassports(list)
    local combinedLine = ""
    local passports = {}
    for i, line in ipairs(list) do
        if line == "" then
            table.insert(passports,combinedLine)
            combinedLine = ""
        else
            combinedLine = combinedLine .. " " ..line
        end
    end
    table.insert(passports,combinedLine)
    return passports
end

function checkRange(number,min,max)
    return tonumber(number) >= min and tonumber(number) <= max
end

function validateParameter(parameter,value)
    if parameter == "byr" then
        return checkRange(value,1920,2002)
    elseif parameter == "iyr" then
        return checkRange(value,2010,2020)
    elseif parameter == "eyr" then
        return checkRange(value,2020,2030)
    elseif parameter == "hgt" then
        local height, unit = string.match(value,"(%d+)(.+)")
        if height then
            if unit == "cm" then    
                return checkRange(height,150,193)
            elseif unit == "in" then
                return checkRange(height,59,76)
            end
        end
    elseif parameter == "hcl" then
        if string.len(value) == 7 and string.sub(value,1,1) == "#" then
            return not string.match(value,"[g-z]")
        end
        return false
    elseif parameter == "ecl" then
        local v = value
        return v=="amb" or v=="blu" or v=="brn" or v=="gry" or v=="grn" or v=="hzl" or v=="oth" 
    elseif parameter == "pid" then
        return string.len(value) == 9
    elseif parameter == "cid" then
        return true
    end
    return false
end

function validatePassport(passport)
    local validthings = {"ecl","pid","eyr","hcl","byr","iyr","hgt"}
    local validCount = 0
    for i, checkValue in pairs(validthings) do
        local a, value = string.match(passport,"("..checkValue.."):(.-)%s")
        if not a then  a, value = string.match(passport,"("..checkValue.."):(.-)$") end
        if not a then return false end
        if not validateParameter(a,value) then return false end
    end
    return true
end

function checkValidCount(list)
    local validCount = 0
    for i, passport in ipairs(list) do
        if validatePassport(passport) then validCount = validCount + 1 end
    end
    return validCount
end


local combinedPassports = combinePassports(numbers)
print(checkValidCount(combinedPassports))