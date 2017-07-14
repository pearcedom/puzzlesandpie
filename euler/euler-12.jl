#calculate number of factors
function nFactors(x, pfactors = Int[], low_fac = 1, i = 2)
    #calculate prime factors
    while low_fac < x
        if x % i == 0
            append!(pfactors, [i])
            low_fac = i
            x = x / low_fac
            i = 2
        else i += 1
        end
    end
    #use prime exponents to calculate total factor n
    prod(hist(pfactors)[2] + 1)
end

#apply up to a factor n limit
function fac2Limit(limit) 
    x = 1
    fac_len = 0
    while fac_len < limit
        fac_len = nFactors(sum(1:x)) #here the sum(1:x) is calculates the results only for triangle numbers
        x += 1
    end
    sum(1:x-1)
end

#semi built-in version
function fac2Limit2(limit)
    x = 28
    n_fac = 6
    while n_fac < limit
        expo = []
        for i in values(factor(sum(1:x)))
            append!(expo, [i + 1])
        end
        n_fac = prod(expo)
        x += 1
    end
    sum(1:x-1)
end

@time fac2Limit(100) #0.017seconds
@time fac2Limit2(100) #0.003seconds
@time fac2Limit2(500) #0.091seconds
