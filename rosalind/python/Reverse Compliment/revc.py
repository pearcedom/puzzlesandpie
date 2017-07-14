s = "AAAACCCGGT"

def revc(s):

    def comp(s):
        comp_dict = {"A": "T", "C": "G", "G": "C", "T": "A"}

        return comp_dict[s]

    z = s[::-1]

    revc_lst = map(comp, z)

    return ''.join(revc_lst)

print revc(s)