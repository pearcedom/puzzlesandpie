#=
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:


21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13


It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

Patterns
 - top left of a odd-dimensional square is odd^2
 - the counter-clockwise corner for any odd^2 is odd^2 - odd + 1
 - this pattern repeats for further counter-clockwise corners
 - it's easier to spot with a bigger square


73 74 75 76 77 78 79 80 81
72 43 44 45 46 47 48 49 50
71 42 21 22 23 24 25 26 51
70 41 20  7  8  9 10 27 52
69 40 19  6  1  2 11 28 53
68 39 18  5  4  3 12 29 54
67 38 17 16 15 14 13 30 55 
66 37 36 35 34 33 32 31 56
65 64 63 62 61 60 59 58 57

So 81 is 9^2, the top left corner must be 9^2 - 9 + 1

=#

function sumSquareDiag(n)
    tr = [i^2 for i in 3:2:n]
    tl = [tr[i] - 2*i for i in 1:length(tr)]
    bl = [tl[i] - 2*i for i in 1:length(tl)]
    br = [bl[i] - 2*i for i in 1:length(bl)]
    sum(sum(i) for i in [tr, tl, bl, br]) + 1
end

sumSquareDiag(1001)
