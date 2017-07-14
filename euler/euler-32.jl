#=
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
=#

# Split multiplicand/multiplier/product into individual digits, sort and compare to a reference
function isPandigital(i, j)
    x = vcat(digits(i*j), digits(i), digits(j))
    if sort(x) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
        true
    else
        false
    end
end

@time isPandigital(39, 186)    

# Do this for all combinations up to a limit
function sumPandigitals(limit)
    tally = []
    for i in 1:limit
        for j in i:(limit)
            if isPandigital(i, j)
                append!(tally, [i*j])
            end
        end
    end
    tally |> unique |> sum
end

# Find a sensible limit (UNFINISHED!)
function mmpLength(n)
    length(digits(n)) * 2 + length(digits(n^2))
end

[i for i in 1:9999 if mmpLength < 9 ]

# Run
@time sumPandigitals(5000)
