#!/usr/bin/env python3

def hamming_distance(s, t):
    if len(s) != len(t):
        return "error: strings differ in lengths"
    else:
        n_chars = len(s)
        return sum(s[i] != t[i] for i in range(n_chars))

if __name__ == '__main__':
    s = "GAGCCTACTAACGGGAT"
    t = "CATCGTAATGACGGCCT"
    print(hamming_distance(s, t))

