#!/usr/bin/env python3

def read_fasta(path):
    """
    Takes a fasta file and returns a dictionary of ids and sequences.
    `f.pop(0)` is necessary for the rosalind data but maybe not for all data?
    """
    with open(path, 'r') as fastas:
        f = fastas.read().replace('\n', '').split('>')
        f.pop(0)
    data = {}
    for i in f:
        data[i[:13]] = i[13:]
    return data

def gc_content(s):
    len_s = len(s)
    n_g = s.count("G")
    n_c = s.count("C")
    gc = ((n_g + n_c) / len_s) * 100
    return gc

def get_highest_gc(path):
    fastas = read_fasta('./data/rosalind_gc.txt')
    gc_contents = {i: gc_content(fastas[i]) for i in fastas}
    max_key = max(gc_contents, key = gc_contents.get)
    return [max_key, gc_contents[max_key]]

if __name__ == '__main__':
    print(get_highest_gc('./data/rosalind_gc.txt'))

    

