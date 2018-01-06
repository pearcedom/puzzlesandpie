#!/usr/bin/env python3

from rna import check_nucleotides

def count_nuc(s):
    """
    Case-insensitively count nucleotides
    """
    dna = s.upper()
    counts = {'A': 0, 'C': 0, 'G': 0, 'T': 0}
    if check_nucleotides(dna):
        for i in ["A", "C", "G", "T"]:
            counts[i] = dna.count(i)
        return counts
    else:
        return "error: non-nucleotide input"

if __name__ == '__main__':
    s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
    print(count_nuc(s))


