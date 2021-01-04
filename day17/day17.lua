local numbers = {}
for line in io.lines("day17/day17.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day17/day17demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function getVoxel(grid,x,y,z)
    
end

function setVoxel(grid,x,y,z)
    
end

function simulate(grid)
    local newGrid = {}

    for x, sub1 in pairs(grid) do
        for y, sub2 in pairs(sub1) do
            for z, sub3 in pairs(sub2) do
                
            end
        end
    end
end