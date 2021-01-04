local numbers = {}
for line in io.lines("day6/day6.txt") do 
    table.insert( numbers, line )
end

local temp = {}
for line in io.lines("day6/day6demo.txt") do 
    table.insert( temp, line )
end

function printList(list)
    for i, item in ipairs(list) do
        print(i .. ":", item)
    end
end

function combineAnswers(lines)
    local combinedLines = {}
    local combinedLine = ""
    for i, line in ipairs(lines) do 
        if line == "" then
            table.insert(combinedLines,combinedLine)
            combinedLine = ""
        else
            combinedLine = combinedLine .. line
        end
    end
    table.insert(combinedLines,combinedLine)
    return combinedLines
end

function countAnswerDiversity(line)
    local answers = {}
    local diversityCount = 0
    for i=1, string.len(line) do
        letter = string.sub(line,i,i)
        if not answers[letter] then
            answers[letter] = true
            diversityCount = diversityCount + 1
        end
    end
    return diversityCount
end

function countAnswerDiversities(lines)
    local total = 0
    for i, line in ipairs(lines) do
        print(line)
        total=total + countAnswerDiversity(line)
    end
    return total 
end

answers = combineAnswers(numbers)
printList(answers)

print(countAnswerDiversities(answers))