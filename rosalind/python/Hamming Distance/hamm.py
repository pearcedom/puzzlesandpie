## Here are our strings
s1 = "GAGCCTACTAACGGGAT"
s2 = "CATCGTAATGACGGCCT"
s_length = len(s1) # and here are their lengths

## We define a function to ask whether to things are identical
# It will return either TRUE or FALSE
def identical(n1, n2):
    return n1 == n2

## We then loop through both strings at once,
## once nucleotide at a time and as 'are they identical?'
output = [] # first define an empty list
for i in range(1, s_length):
    output.append(identical(s1[i], s2[i]))

## The number of mis-matches is the sum of output (i.e. the
## number of TRUEs) substracted from the length of the strings
print s_length - sum(output)
