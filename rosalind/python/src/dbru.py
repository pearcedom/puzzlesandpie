#!/usr/bin/env python3

from revc import reverse_comp

def dbru(s):
    s_rc = {reverse_comp(i) for i in s} 
    sUs_rc = s.union(s_rc) 
    edges = {(i[:-1], i[1:]) for i in sUs_rc}
    return edges

if __name__ == '__main__':
    s = {"TGAT", "CATG", "TCAT", "ATGC", "CATC", "CATC"}
    dbru_out = sorted(dbru(s))
    [print(i) for i in dbru_out]
