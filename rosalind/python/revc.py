#!/usr/bin/env python3

from rna import check_nucleotides

def reverse_comp(s):
    comps = {'A': 'T', 'G': 'C',
             'T': 'A', 'C': 'G'
            }
    input = s.upper()
    tupni = input[::-1]
    revc = [comps[i] for i in tupni]
    return ''.join(revc)

if __name__ == '__main__':
    with open('data/rosalind_revc.txt', 'r') as ros_in:
        s=ros_in.read().replace('\n', '')
    reverse_comp(s)

    #with open('output/revc.txt', 'w') as ros_out:
    #    ros_out.write(reverse_comp(s))
