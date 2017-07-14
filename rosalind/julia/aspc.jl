#=
Pascals triangles triangles can be use to calculate C(n, k) where n is the row and k is the "column"

e.g. C(4, 3) = 6 (don't forget we start from the empty set - i.e. row 0)

     1
    1 1
   1 2 1
  1 3 3 1
 1 4 6 4 1
=#

function pascalRec(depth)
    n = 2
    row = big([1, 1])
    while n < depth
        row = vcat(1, [row[i] + row[i+1] for i in 1:length(row)-1], 1)
        n += 1
    end
    row
end

sum(pascalRec(1882+1)[1029+1:end]) % 1000000
