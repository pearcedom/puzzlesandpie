#=
The following iterative sequence is defined for the set of positive integers:
    n → n/2 (n is even)
    n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
    13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=#

function solveCollatz(n)
    seq = Int[n]
    while n > 1
        if n % 2 == 0
            n = Integer(n / 2)
        else
            n = Integer(3*n + 1)
        end
        append!(seq, [n])
    end
    seq
end

@time collatz_len = Dict([(length(solveCollatz(i)), i) for i in 1:999999]) #11.5 seconds
collatz_len[maximum(keys(collatz_len))]

@time collatz_len2 = map(solveCollatz, 1:999999) #28.0 seconds

function collatzLength(n)
    len = 1
    while n > 1
        if n % 2 == 0
            n = Integer(n / 2)
        else
            n = Integer(3*n + 1)
        end
        len += 1
    end
    len
end

@time col_len = [collatzLength(i) for i in 1:999999]
findmax(col_len)

[(i, j) for i = 1:10 for j = 2:11]
