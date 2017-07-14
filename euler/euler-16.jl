#=
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
=#

x = BigInt(1)
for i in 1:1000
    x += x
end

sum(digits(x))

#=
Question:
why doesn't BigInt(2^1000) work?
=#
