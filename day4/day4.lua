local numbers = {}
for line in io.lines("day4/day4.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day4/day4demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in ipairs(list) do
        print(i .. ":", item)
    end
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

function validatePassport(passport)
    local validthings = {"ecl","pid","eyr","hcl","byr","iyr","hgt"}
    local validCount = 0
    for i, checkValue in pairs(validthings) do
        if string.match(passport,checkValue) then validCount = validCount + 1 end
    end
    return validCount == #validthings
end

function checkValidCount(list)
    local validCount = 0
    for i, passport in ipairs(list) do
        if validatePassport(passport) then validCount = validCount + 1 end
    end
    return validCount
end

-- local testPassport = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
local combinedPassports = combinePassports(numbers)
print(checkValidCount(combinedPassports))