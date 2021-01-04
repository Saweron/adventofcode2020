print("Solving day 1")
local totalFuel = 0
for line in io.lines("Day01.txt") do
    local fuel = math.floor(line / 3) - 2
    totalFuel = totalFuel + fuel;
end

print("Total fuel: " .. totalFuel)

-------

local function fuelNeeded(mass)
    local fuel = math.floor(mass / 3) - 2
    if (fuel < 0) then return 0 end

    local extraFuel = fuelNeeded(fuel)
    return fuel + extraFuel
end

totalFuel = 0
for mass in io.lines("Day01.txt") do
    local fuel = fuelNeeded(mass)
    totalFuel = totalFuel + fuel;
end

print("Total fuel with fuel: " .. totalFuel)
