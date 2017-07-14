#=
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=#


function isTrivial(a, b) #checks that it's not trivial, i.e. not just multiples of 10
    [a/10, b/10] != [digits(a)[2], digits(b)[2]]
end

function isSharedDigits(a, b) #checks that the numerator and denominator share a digit to be cancelled by
    any(i == j for i in digits(a) for j in digits(b))
end


a, b = 49, 98
function isCurious(a, b)
    if isSharedDigits(a, b) & isTrivial(a, b)
        asdf = [[i, j] for i in digits(a) for j in digits(b) if a/b == i/j]
        if intersect(intersect(digits(a), digits(b)), asdf[1]) |> isempty #checks that the cancelled digit was the same
            [a, b]
        end
    end
end

unique(isCurious(i, j) for i in 10:99 for j in i+1:99)

49/98
16/64
19/95
26/65

x = 49 * 16 * 19 * 26
y = 98 * 64 * 95 * 65

y / x


#=
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=#


function isTrivial(a, b)
    [a/10, b/10] != [digits(a)[2], digits(b)[2]]
end

function isSharedDigits(a, b)
    any(i == j for i in digits(a) for j in digits(b))
end

function isCurious(a, b)
    if isSharedDigits(a, b) & isDigitCancelling(a, b) & isTrivial(a, b)
        asdf = [[i, j] for i in digits(a) for j in digits(b) if a/b == i/j]
        if intersect(intersect(digits(a), digits(b)), asdf[1]) |> isempty
            [a, b]
        end
    end
end

unique(isCurious(i, j) for i in 10:99 for j in i+1:99)

49/98
16/64
19/95
26/65

x = 49 * 16 * 19 * 26
y = 98 * 64 * 95 * 65

y / x


