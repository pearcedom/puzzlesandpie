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



 ATTAC
   TACAG
GATTA
    ACAGA
     CAGAT
  TTACA
      AGATT
GATTACAGATT

    A T T A C
  0 0 0 0 0 0 
G 0 0 0 0 0 0
A 0 1 0 0 1 0
T 0 0 2 1 0 0
T 0 0 1 3 0 0
A 0 1 0 0 4 0

#create scoring matrix
def scoring_matrix(nrow, ncol):
    return [[0 for i in range(0, ncol+1)] for j in range(0, nrow+1)]


x = kmers[0]
y = kmers[2]
def longest_common_substring(x, y):
    len_x = len(x)
    len_y = len(y)
    mtx = scoring_matrix(len(y), len(x))
    for i in range(len_x):
        for j in range(len_y):
            if x[i] == y[j]:
                mtx[j+1][i+1] = mtx[j][i] + 1
    #find the highest value and it's position
    high_val = max(max(mtx))
    high_row = mtx.index(max(mtx))
    high_col = mtx[high_row].index(max(mtx[high_row]))
    lcs = x[high_col-high_val:high_col]
    return lcs

##then find the highest within the kmers
kmers = ["ATTAC", "TACAG", "GATTA", "ACAGA", "CAGAT", "TTACA", "AGATT"]
pcov = kmers[0]
del kmers[0]

[len(longest_common_substring(pcov, i)) for i in kmers]




##and combine and repeat with the new pseudo-kmer
#by findind which ever of...
pcov.index("ATTA")
# =0 and adding the other minus "ATTA" to the beginning


##I think this is redundent now
trailing_x0 = high_col-high_val 
trailing_xend = len_x-high_col 

trailing_y0 = high_row-high_val 
trailing_yend = len_y-high_row


target = "GATTACA"













if __name__ == '__main__':

