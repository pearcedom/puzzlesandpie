
s_list = ["GATTACA", "TAGACCA", "ATACA", "ATTAGCGACTACG", "TCGCGACTCACGACTACGACTATTGAC"]
s_min =  min(s_list)

s_list.remove(s_min)

chomped = []
for j in range(0, len(s_min)-1):
    for i in range(len(s_min), 1, -1):
        chomped.append(s_min[j:i])

# # while '' in chomped:
# #     chomped.remove('')

chomped.sort(key = len, reverse = True)


match = [False]
while match[len(match)-1] == False:
    for i in chomped:
        tmp = []
        for j in s_list:
            tmp.append(j.find(i) > -1)
        match.append(all(tmp))

print chomped[match.index(True)-1]
