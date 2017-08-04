#=
A string ss is a supersequence of another string tt if ss contains tt as a subsequence.

A common supersequence of strings ss and tt is a string that serves as a supersequence of both ss and tt. For example, "GACCTAGGAACTC" serves as a common supersequence of "ACGTC" and "ATAT". A shortest common supersequence of ss and tt is a supersequence for which there does not exist a shorter common supersequence. Continuing our example, "ACGTACT" is a shortest common supersequence of "ACGTC" and "ATAT".

Given: Two DNA strings ss and tt.

Return: A shortest common supersequence of ss and tt. If multiple solutions exist, you may output any one.
=#

#s = "ATCTGAT"
#t = "TGCATA"

# AT C TGAT
#  TGCAT A

s, t = "ACGTC", "ATAT"
len_s, len_t = length(s), length(t)

# ACGT C
# A  TA T

   ACGTC
  
  000000 
A 010000
T 000010
A 010000
T 000010

function longComSub(s, t)
    #create match matrix
    len_s, len_t = length(s), length(t)
    mtx = zeros(Int64, len_t + 1, len_s + 1)
    for i in 1:len_t
        for j in 1:len_s
            if t[i] == s[j]
                mtx[i+1, j+1] = mtx[i, j] + 1
            end
        end
    end
    mtx
    # travel backwards to find the longest matching sequence
    mtx_max = ind2sub(size(mtx), indmax(mtx))
    lcss = []
    while mtx[mtx_max[1], mtx_max[2]] != 0
        lcss = vcat(t[mtx_max[1] - 1], lcss)
        mtx_max = [i - 1 for i in mtx_max]
    end
    lcss
end



lcss_ind = findin(longComSub(s, t), s)

findin("ACG", s)

if lcss_ind[1] != 1
    















