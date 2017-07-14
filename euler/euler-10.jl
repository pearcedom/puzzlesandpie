# Problem 10
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.

#Create a dictionary from one to our limit as keys and all values set to true
limit = 1999999
dict = Dict([tuple(string(i), true) for i in 2:limit])

#=Then we use a seive where, for each number starting from two, every possible multiple of that number mustn't be prime and we mark its dictionary entry as false - i.e. if 2 is prime then it 4, 6, 8 etc.. are not. We then move to the next lowest value that has remained true and then repeat. Only the numbers that are divisble by themselves and by 1 will remain as true. Also, by this logic we only need to go as far as the square root of our current test number=#
@time for i in 2:round(Int, sqrt(limit))
    if dict[string(i)] == true
        for j in i+i:i:limit
            dict[string(j)] = false
        end
    end
end
#~12 seconds

#Having discounted all non-primes we find the remaining trues and sum
primes = []
for i in 2:limit
    if dict[string(i)] == true
        append!(primes, [i])
    end
end
sum(primes)