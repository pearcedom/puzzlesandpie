
function iseuPrime(n, i, j)
    x = n^2 + i*n + j
    isPrime(abs(x))
end


function quadraticPrimes(a, b)
    most_prime = 0
    best_coef = [0, 0]
    #for all values of 1000 < a < 1000
    for i in -a:a         
        #and all values of 1000 <= b <= 1000
        for j in -b:b
            #calculate length number of consecutive primes for the particular coefficient pair
            n = 0
            while iseuPrime(n, i, j)
                n += 1
            end
            #if it exceeds the previous best then replace
            if n > most_prime
                best_coef[1], best_coef[2] = i, j
                most_prime = n 
            end
        end
    end
    print(most_prime)
    best_coef 
end

ans = quadraticPrimes(999, 1000)
prod(ans)

