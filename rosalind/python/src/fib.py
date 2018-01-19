#!/usr/bin/env python3

def get_fib(n, k = 1):
    """
    Calculated number of rabbits after n generations,
    given k offspring per fertile generation.
    If k = 1 the fibonnaci sequence is returned.
    """
    if n == 1 or n == 2:
        return 1
    else:
        pre1 = get_fib(n-1, k)
        pre2 = get_fib(n-2, k)
        return (pre1 + (pre2 * k))


if __name__ == '__main__':
    print(get_fib(5, 3))
