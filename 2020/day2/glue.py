examples = []
with open('example-pass.txt') as x:
    for line in x:
        examples.append(line)

letters = []
with open('letters.txt') as x:
    for line in x:
        letters.append(line)

maxNums = []
with open('max-nums.txt') as x:
    for line in x:
        maxNums.append(int(line))

minNums = []
with open('min-nums.txt') as x:
    for line in x:
        minNums.append(int(line))

validPasswords = []

for i in range(len(examples)):
    if (examples[i].count(letters[i]) >= minNums[i] and examples[i].count(letters[i]) <= maxNums[i]):
        validPasswords.append(examples[i])

print(len(validPasswords))
