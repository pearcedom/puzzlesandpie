#=
A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
=#

#=
A fraction in lowest terms with a prime denominator other than 2 or 5 (i.e. coprime to 10) always produces a repeating decimal. The length of the repetend (period of the repeating decimal) of 1/p is equal to the order of 10 modulo p. If 10 is a primitive root modulo p, the repetend length is equal to p − 1; if not, the repetend length is a factor of p − 1. This result can be deduced from Fermat's little theorem, which states that 10p−1 ≡ 1 (mod p).

The base-10 repetend of the reciprocal of any prime number greater than 5 is divisible by 9.[3]

If the repetend length of 1/p for prime p is equal to p − 1 then the repetend, expressed as an integer, is called a cyclic number.
=#

function nCycles(d, n)
    a = (10^n * 1 / d) - 1 / d 
    b = round(10^n * 1 / d)
    a % b == 0
end

[i for i in 1:7 if nCycles(7, i)] #1/7 = 0.142857...

d, n = 983, 981
function nCyclesBig(d, n)
    a = (big(10)^n * big(1) / d) - big(1) / d 
    b = round(big(10)^n * big(1) / d)
    a % b == 0
end


[i for i in 1:984 if nCyclesBig(984, i)]
















































function isPrime(n)
    if all(n % i != 0 for i in 2:n-1)
        true
    else
        false
    end
end

primes = [i for i in 1:999 if isPrime(i) == true]



#1/d has a cycle of n digits if 10n - 1 mod d = 0 for prime d


function fmlt(d, n) 
    (big(10)*n -1) % d
end

rec_len = []
for i in primes 
    for j in 1:i
        if fmlt(i, j) == 0
            append!(rec_len, [j])
            break
        end
    end
end
rec_len

primes[indmax(rec_len)]   
