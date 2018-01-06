"""Python For Biologists Exercises."""
from __future__ import division

my_dna = "ACGTGGTCTAGGAGCTAGCATCAGGAGCAGCTACTACGAGATCGACTCATCATCTGA"


"""Calculate AT_Content"""
def AT_Content(s):
    As = s.count("A")
    Ts = s.count("T")

    ATs = As + Ts

    return str(ATs / len(s) * 100) + "%"

print AT_Content(my_dna)


"""Complement DNA"""
def complementDNA(s):
    s = s.replace("A", "1")
    s = s.replace("G", "2")
    s = s.replace("C", "G")
    s = s.replace("T", "A")
    s = s.replace("1", "T")
    return s.replace("2", "C")

print complementDNA(my_dna)


"""Restriction Cuts"""
def restCut(s):
    up_length = s.find("CATCAGG") + 1
    down_length = len(s) - up_length
    print "Upstream fragment length = %d nucleotides" % up_length
    print "Downstream fragment length = %d nucleotides" % down_length

restCut(my_dna)
print len(my_dna)
