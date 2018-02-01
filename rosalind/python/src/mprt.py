#!/usr/bin/env python3

import re
import urllib

def getUniprotSeq(prot):
    prot_data = urllib.request.urlopen(
            "http://www.uniprot.org/uniprot/" + prot + ".fasta").read().decode("UTF-8").splitlines()
    prot_seq = ''.join(prot_data[1:])
    return prot_seq

def indexMotif(p):
    motif = "(?=(N)([A-O]|[Q-Z])(S|T)([A-O]|[Q-Z]))"
    finditer_out = re.finditer(motif, p)
    return [i.start() + 1 for i in finditer_out]

if __name__ == '__main__':
    #proteins = ["A2Z669", "B5ZC00", "P07204_TRBM_HUMAN", "P20840_SAG1_YEAST" ]
    proteins = ["P02790_HEMO_HUMAN", "P01588_EPO_HUMAN", "P13473_LMP2_HUMAN", "P01866_GCB_MOUSE", "P24592_IBP6_HUMAN", "P21809_PGS1_BOVIN", "Q0TMT1", "P02974_FMM1_NEIGO", "B5FNU0", "P01189_COLI_HUMAN", "P02186", "P01047_KNL2_BOVIN", "A6UDH9", "P01787", "P01190_COLI_BOVIN"]
    fastas = [getUniprotSeq(i) for i in proteins]
    indexes = [indexMotif(p) for p in fastas]
    #make it print nice
    output = list(zip(proteins, indexes))
    [[print(j) for j in i] for i in output if len(i[1]) > 0]


