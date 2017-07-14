#if a number % all of 1:20 is equal to 0 then it satisfies the question
function isDivisible(n)
    all([n % i == 0 for i in 1:20])
end

#we check each number from 20 upwwards cycling by 20 to speed things up
n = 20
@time while !isDivisible(n)
    n = n + 20
end
n
