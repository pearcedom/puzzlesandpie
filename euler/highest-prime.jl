#https://projecteuler.net/problem=3

#initial values and variables
n, factors, low_fac, i = 600851475143, [], 1, 2

#then find the smallest factor that isn't 1 (this will be a prime), divide n by that and start the process again
while low_fac < n
  if n % i == 0
    append!(factors, i)
    low_fac = i
    n = n / low_fac
    i = 2
  else i = i + 1
  end
end

factors

#we can double check our factors (which aren't too big) are truly prime by brute force
function isPrime(n)
 if sum(n % i == 0 for i in 2:n-1) == 0
    true
  end
end

[isPrime(i) for i in factors]
