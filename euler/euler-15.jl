#=
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?

Catalan Number Formula (Cn)
   (2n)!
----------
 (n+1)!n!

 Paths Formula 
 (n+1)Cn
=#


function catN(n)
    if n > 20
        Integer(factorial(BigInt(2*n)) / (factorial(BigInt(n+1)) * factorial(BigInt(n))))
    else 
        Integer(factorial(2*n) / (factorial(n+1) * factorial(n)))
    end
end

function routeN(n)
    if n > 10
        (n+1) * catN(BigInt(n))
    else  
        (n+1) * catN(n)
    end
end

[routeN(i) for i in 1:20]