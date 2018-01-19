#!/usr/bin/env python3

def check_nucleotides(s):
    """
    Check that only ATGC is in a given dna string.
    """
    dna = s.upper()
    for i in ["A", "T", "G", "C"]:
        dna = dna.replace(i, "")
    return len(dna) == 0

def transcribe_dna(s):
    """
    Take a case-insensitive dna input and convert to rna equivalent.
    Also checks if any letters beyond ATGC are included in the
    input.
    """
    dna = s.upper()
    if check_nucleotides(dna):
        return(dna.replace("T", "U"))
    else:
        return "error: non-nucleotide input"

if __name__ == '__main__': 
    dna = "AGCTGGACGCTACGACGGACTACGATTAGAGTCGACGACTTAGAGAGCTCTCTTGTGTGAGTAGCATGG"
    print(transcribe_dna(dna))
