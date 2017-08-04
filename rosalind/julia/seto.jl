#http://rosalind.info/problems/seto/

a = [1, 2, 3, 4, 5]
b = [2, 8, 5, 10]

function setOps(a, b, n)
    [
    #union
    ∪(a, b),  
    #intersection
    ∩(a, b),
    #set difference A-B
    setdiff(a, b),
    #set difference B-A
    setdiff(b, a),
    #set complement A
    setdiff(1:n, a),
    #set complement B
    setdiff(1:n, b),
   ]
end

setOps(a, b, 10)
