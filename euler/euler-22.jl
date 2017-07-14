# Alphabet-score dictionary
alphadict = Dict(zip(['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'], [i for i in 1:26]))

# Read in file
f = open("./data/euler-22_names.txt")
s = readstring(f)
names = split(s, "\",\"")
names[1] = names[1][2:5]
names[end] = names[end][1:6]
names_sort = sort(names)

# Sum scores and multiply by position
total = 0
for i in 1:length(names_sort)
    total += i * sum(alphadict[j] for j in names_sort[i])
end
total
