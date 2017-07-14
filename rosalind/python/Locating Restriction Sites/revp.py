##Calculate reverse compliment - from earlier puzzle
def revc(s):

    def comp(s):
        comp_dict = {"A": "T", "C": "G", "G": "C", "T": "A"}

        return comp_dict[s]

    z = s[::-1]

    revc_lst = map(comp, z)

    return ''.join(revc_lst)

s = "TCAATGCATGCGGGTCTATATGCAT"

z = revc(s)

for j in range(4):
    s_chmp = []
    for i in range(0, len(s)-(j+1)):
        s_chmp.append(s[i:i+j])

    z_chmp = []
    for i in range(0, len(z)-(j+1)):
        z_chmp.append(z[i:i+j])

    match = []
    for i in z_chmp[0:3]:
        match.append(s_chmp.index(i) + 1)


print match
