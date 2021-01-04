local numbers = {}
for line in io.lines("day16/day16.txt") do 
    table.insert( numbers,line)
end

local temp = {}
for line in io.lines("day16/day16demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end


function split(lines)
    local mode = 1
    local ranges = {}
    local ynumbers = {}
    local nnumbers = {}
    for i, item in ipairs(lines) do
        -- get ranges
        if item == "your ticket:" then
            mode = 2
        elseif item == "nearby tickets" then
            mode = 3
        elseif mode == 1 then
            local name,a,b,c,d= string.match(item,"(.-): (.-)-(.-) or (.-)-(.+)")
            table.insert(ranges,{min=a,max=b})
            table.insert(ranges,{min=c,max=d})
            print(name,a,b,c,d)
        elseif mode == 2 then

        end
        -- get your ticket items
        -- get nearby tickets
    end
    return ranges,ynumbers,nnumbers
end

split(temp)

function checkTicketValidity(number,ranges)

end

