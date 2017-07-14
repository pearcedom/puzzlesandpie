import random

def kmerComposition(s):
    kmers = [s[x:x+4] for x in range(0, len(s)-3)]

    nucs = ["A", "T", "G", "C"]
    allmers = [''.join([random.choice(nucs) for x in range(1, 5)]) for i in range(1, 10000)]
    uniquemers = list(set(allmers))
    uniquemers.sort()

    return([kmers.count(i) for i in uniquemers])
