#!/usr/bin/env python3

"""
Problem

A circular string is a string that does not have an initial or terminal element;
instead, the string is viewed as a necklace of symbols. We can represent a 
circular string as a string enclosed in parentheses. For example, consider the 
circular DNA string (ACGTAC), and note that because the string "wraps around" at
the end, this circular string can equally be represented by (CGTACA), (GTACAC), 
(TACACG), (ACACGT), and (CACGTA). The definitions of substrings and superstrings
are easy to generalize to the case of circular strings (keeping in mind that 
substrings are allowed to wrap around).

Given: A collection of (error-free) DNA kk-mers (k≤50) taken from the same 
strand of a circular chromosome. In this dataset, all kk-mers from this strand 
of the chromosome are present, and their de Bruijn graph consists of exactly 
one simple cycle.

Return: A cyclic superstring of minimal length containing the reads (thus 
corresponding to a candidate cyclic chromosome).
"""

#  ATTAC
# GATTA
#   TTACA
#    TACAG
#     ACAGA
#      CAGAT
#       AGATT
# GATTACA

#     A T T A C
#   0 0 0 0 0 0 
# G 0 0 0 0 0 0
# A 0 1 0 0 1 0
# T 0 0 2 1 0 0
# T 0 0 1 3 0 0
# A 0 1 0 0 4 0

#create scoring matrix
def scoring_matrix(nrow, ncol):
    return [[0 for i in range(0, ncol+1)] for j in range(0, nrow+1)]

def longest_common_substring(x, y):
    len_x = len(x)
    len_y = len(y)
    mtx = scoring_matrix(len(y), len(x))
    for i in range(len_x):
        for j in range(len_y):
            if x[i] == y[j]:
                mtx[j+1][i+1] = mtx[j][i] + 1
    #find the highest value and it's position
    max_by_row = [max(i) for i in mtx]
    high_val = max(max_by_row)
    high_row = max_by_row.index(high_val)
    high_col = mtx[high_row].index(max(mtx[high_row]))
    lcs = x[high_col-high_val:high_col]
    return lcs


def synthesise_kmers(kmers):
    #take the first kmer
    pcov = kmers[0]
    del kmers[0]
    
    while len(kmers) > 0:
        #find the longest lcs within the other kmers
        best_kmer = ''
        llcs_len = 0
        for i in kmers:
            lcs = longest_common_substring(pcov, i)
            if len(lcs) > llcs_len:
                best_kmer = i
                llcs = lcs
                llcs_len = len(lcs)
        #and combine, at the correct end and making sure not to add anything 
        #that is actually a cyclical repeat
        pot_rep = best_kmer.replace(llcs, '')
        if pcov.index(llcs) == 0 and pot_rep != pcov[len(pcov)-len(pot_rep):]:
            pcov = best_kmer[0:best_kmer.index(llcs)] + pcov
        elif best_kmer.index(llcs) == 0 and pot_rep != pcov[0:len(pot_rep)]:
            pcov = pcov[0:pcov.index(llcs)] + best_kmer
        else:
            pcov = pcov
        del kmers[kmers.index(best_kmer)]
    return pcov

if __name__ == '__main__':
    kmers = ["ATTAC", "TACAG", "GATTA", "ACAGA", "CAGAT", "TTACA", "AGATT"]
    print(synthesise_kmers(kmers))
