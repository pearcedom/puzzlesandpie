https://projecteuler.net/problem=1

s = range(1, 1000)

sum(i for i in s if i % 3 == 0 or i % 5 == 0)
