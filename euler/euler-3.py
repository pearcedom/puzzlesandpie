https://projecteuler.net/problem=3

n = 13195003
sq = range(2, n+1)
#print(sq)

def isPrime(n):
    if all(n % i != 0 for i in range(2, n)) == True:
        return(n)

print filter(None, [isPrime(i) for i in sq if n % i == 0])
