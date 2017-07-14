from __future__ import division

s = ["CCTGCGGAAG", "AACATTAGAGCCT"]

def gcContent(s):
    s = s.upper()
    gc_count = s.count("G") + s.count("C")
    return(gc_count / len(s) * 100)

for seq in s:
    print gcContent(seq)
