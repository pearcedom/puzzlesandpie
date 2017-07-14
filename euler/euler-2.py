https://projecteuler.net/problem=2

#seed our Fibonacci with 1, 2
seed = [1, 2]

#calculate Fibonacci sequence up to the first element to break 4mil
while (max(seed) < 4000000):
    seed.append(seed[len(seed)-1] + seed[len(seed)-2])
#remove that last element as we only want up to 4mil
fib = seed[:len(seed)-1]

#for even values (% 2 == 0), sum
print sum(i for i in fib if i % 2 == 0)
