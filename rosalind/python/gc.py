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
        data[i[:13]] = i[14:]
        

def gc_content(fastas):




if __name__ == '__main__':

    'data/rosalind_gc.txt'
