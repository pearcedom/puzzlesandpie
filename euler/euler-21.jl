# Find the sum of all the amicable numbers under 10000

# Function to calculate sum of factors
function sumFactors(n)
    if n == 1
        1
    else
        sum(i for i in 1:n-1 if n % i == 0)
    end
end

# Loop through in an utterly ridiculous way
function sumAmicables(limit)
    tally = 0
    for i in 1:limit-1
        i_sum = sumFactors(i)
        for j in i+1:limit
            if i_sum == j
                if sumFactors(j) == i
                    tally += i + j
                end
            end
        end
    end
    tally
end

@time sumAmicables(10000) #1.66 seconds

