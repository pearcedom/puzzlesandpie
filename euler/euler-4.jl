#to calculate if a number is palindromic
function isPalindrome(x)
    s = string(x)
    len = length(s)
    if len % 2 == 0
        half1 = convert(Int64, len/2)
        half2 = half1 + 1
    else
        half1 = convert(Int64, round(len/2))
        half2 = half1
    end
    s[1:half1] == reverse(s[half2:len])
end

#then cycle back through 3 digit numbers, returning if i*j is a palindrome
palindromes = [return(i*j) for j in 999:-1:100 for i in 999:-1:100 if isPalindrome(i*j)]

#sort to grab the largest
sort(palindromes, rev = true)
