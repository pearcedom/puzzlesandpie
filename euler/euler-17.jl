#=
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
=#

dic = Dict(zip(["0", "00", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "30", "40", "50", "60", "70", "80", "90" ], ["", "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]))

function countLetters(n)
    s = string(n)
    v = ""
    while endof(s) >= 1
        if endof(s) == 4
            v *= dic[string(s[1])] * "thousand"
        elseif endof(s) == 3
            if s[2:end] == "00"
                v *= dic[string(s[1])] * "hundred"
            else
                v *= dic[string(s[1])] * "hundredand"
            end
        elseif endof(s) == 2
            if s[1] == '1'
                v *= dic[string(s)]
                s = ""
            else
                v *= dic[string(s[1]) * "0"]
            end
        elseif endof(s) == 1
            v *= dic[s]
        end
        s = s[2:end]
    end
v
end

# Examples plus some difficult ones
countLetters(635) # sixhundredandthirtyfive
countLetters(211) # twohundredandeleven
countLetters(900) # ninehundred

# Loop and count
output = ""
for i in 1:1000
    output *= countLetters(i)
end
endof(output)
