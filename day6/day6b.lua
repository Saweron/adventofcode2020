local numbers = {}
for line in io.lines("day6/day6.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day6/day6demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in pairs(list) do
        print(i .. ":", item)
    end
end

function combineAnswers(lines)
    local groups = {}
    local group = {}
    for i, line in ipairs(lines) do 
        if line == "" then
            table.insert(groups,group)
            group = {}
        else
            table.insert(group,line)
        end
    end
    table.insert(groups,group)
    return groups
end

function countAnswerDiversity(group)
    local answers = {}
    local count = 0
    for i=1, #group do
        letters = group[i]
        for j=1, string.len(letters) do
            letter = string.sub(letters,j,j)
            if answers[letter] then
                answers[letter] = answers[letter] + 1
            else
                answers[letter] = 1
            end
        end
    end
    for i, item in pairs(answers) do
        if item == #group then
            count = count + 1
        end
    end
    return count
end

function countAnswerDiversities(lines)
    local total = 0
    for i, line in ipairs(lines) do
        total=total + countAnswerDiversity(line)
    end
    return total 
end

answers = combineAnswers(numbers)
print(countAnswerDiversities(answers))