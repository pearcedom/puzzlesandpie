#=
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
=#

# To calculate sum of factors
function sumFactors(n)
    if n == 1
        1
    else
        sum(i for i in 1:n-1 if n % i == 0)
    end
end

# To determine if a numbers factors exceed itself
function findAbundant(n)
    if sumFactors(n) > n
        true
    else
        false
    end
end

# Find all abundant numbers
abundant_n = [i for i in 1:28123 if findAbundant(i)]
len = length(abundant_n)

# For each of our
tally = []
for i in 1:len
    for j in i:len
        if abundant_n[i] + abundant_n[j] <= 28123
            append!(tally, [abundant_n[i] + abundant_n[j]])
        end
    end
end
tally = unique(tally)

# The sum of all the numbers up to our limit minue the sum of our abundant sums will be the sum of all the numbers which are not abundant sums!
sum(1:28123) - sum(unique(tally))
