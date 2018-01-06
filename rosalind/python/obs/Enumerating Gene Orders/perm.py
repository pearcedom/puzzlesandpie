
import math
import itertools

def rosPerm(n):
    # Calculate number of permutations as factorial(n)
    no_perms =  math.factorial(3)

    # Define sequence and permute
    seq = range(1, n + 1)

    print no_perms
    print list(itertools.permutations(seq))

rosPerm(3)
