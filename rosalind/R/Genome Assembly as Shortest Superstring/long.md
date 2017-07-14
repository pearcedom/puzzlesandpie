Genome Assembly as Shortest Superstring
================

The problem [here](http://rosalind.info/problems/long/) is, given a set of nucleotide strings, assemble the shortest possible combination. For example :

*ATTAGACCTG*
              *CCTGCCGGAA*
                    *GCCGGAATAC*
      *AGACCTGCCG*
**ATTAGACCTGCCGGAATAC**

To solve we order our strings, find the largest flanking overlaps and then join, one at a time and for all possible orders.

### Libraries

``` r
library(tidyverse)
library(combinat)
source("/Volumes/igmm-1/sims-lab/Dominic/Functions/Rosalind/longest-common-substring.R")
```

### ***Kluge***

#### *Noun*

##### A kludge (or kluge) (/klʌdʒ/, /kluːʒ/, /kluːdʒ/) is a workaround or quick-and-dirty solution that is clumsy, inelegant, inefficient, difficult to extend and hard to maintain.

#### Arrange our inputs, define parameters, calculate order permutations

``` r
s_vec <- c(s1 = "ATTAGACCTG", s2 = "CCTGCCGGAA", s3 = "AGACCTGCCG", s4 = "GCCGGAATAC")
s_lst <- lapply(s_vec, function(x) strsplit(x, "")) %>% unlist(recursive = FALSE)
perm_lst <- lapply(permn(4), function(x) {
    s_lst[x]
})

n <- nchar(s_vec[1])
```

|     | X1  | X2  | X3  | X4  | X5  | X6  | X7  | X8  | X9  | X10 |
|-----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
| s1  | A   | T   | T   | A   | G   | A   | C   | C   | T   | G   |
| s2  | C   | C   | T   | G   | C   | C   | G   | G   | A   | A   |
| s3  | A   | G   | A   | C   | C   | T   | G   | C   | C   | G   |
| s4  | G   | C   | C   | G   | G   | A   | A   | T   | A   | C   |

|     | X1  | X2  | X3  | X4  | X5  | X6  | X7  | X8  | X9  | X10 |
|-----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
| s4  | G   | C   | C   | G   | G   | A   | A   | T   | A   | C   |
| s2  | C   | C   | T   | G   | C   | C   | G   | G   | A   | A   |
| s3  | A   | G   | A   | C   | C   | T   | G   | C   | C   | G   |
| s1  | A   | T   | T   | A   | G   | A   | C   | C   | T   | G   |

``` r
superstrings <- lapply(perm_lst, function(boop){
    #Working in order, grab the first element of our ordered string list
    s <- boop[[1]]
    #Then, one at a time, compare the subsequent strings to s, finding the largest flanking overlap possible and then merge on this overlap. Importantly as our superstring grows, we first have to check that our comparison string isn't found wholly within
    for(i in boop[-1]) {
        if(length(lcSubstring(s, i)) == length(i)){
            s <- s
        } else {
            #To actually achieve this first get the last 10 nucleotides of s (as s will grew incrementally with each addition) and knock a nucleotide at a time off of the front of t and the end of i. Then find the first time that t and i are identical
            t <- s[(length(s) - n + 1):length(s)]
            overlaps <- lapply(0:(n-1), function(x) {
                    all(t[(x + 1):n] == i[1:(n - x)])
                }
            )
            n_cut <- n+1 - overlaps %>% unlist() %>% which() %>% .[1]
        #Finally, remove the overlap in one string and join. If there is no overlap then just join
        if(!is.na(n_cut)){
            s <- c(s, boop[[2]][-c(1:n_cut)])    
        } else {
            s <- c(s, boop[[2]])
        }        
    }
}
    s    
})
```

#### And the answer

``` r
sapply(superstrings, length) %>% sort()
```

    ##  [1] 19 19 19 19 22 25 25 26 26 29 31 31 33 33 33 33 33 35 35 35 35 36 37
    ## [24] 37

``` r
superstrings
```

    ## [[1]]
    ##  [1] "A" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "G"
    ## [18] "A" "A"
    ## 
    ## [[2]]
    ##  [1] "A" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "G"
    ## [18] "A" "A"
    ## 
    ## [[3]]
    ##  [1] "A" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T"
    ## [18] "A" "C"
    ## 
    ## [[4]]
    ##  [1] "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "A" "T" "T" "A" "G" "A" "C"
    ## [18] "C" "T" "G" "G" "A" "C" "C" "T" "G" "A" "T" "T" "A" "G" "A" "C" "C"
    ## [35] "T" "G"
    ## 
    ## [[5]]
    ##  [1] "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "A" "T" "T" "A" "G" "A" "C"
    ## [18] "C" "T" "G" "C" "T" "G" "A" "T" "T" "A" "G" "A" "C" "C" "T" "G"
    ## 
    ## [[6]]
    ##  [1] "A" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T"
    ## [18] "A" "C"
    ## 
    ## [[7]]
    ##  [1] "A" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "C" "T" "G" "C"
    ## [18] "C" "G" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G"
    ## 
    ## [[8]]
    ##  [1] "A" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "C" "C" "G" "C"
    ## [18] "T" "G" "C" "C" "G"
    ## 
    ## [[9]]
    ##  [1] "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "A" "T" "T" "A" "G" "A" "C"
    ## [18] "C" "T" "G" "G" "A" "C" "C" "T" "G" "T" "T" "A" "G" "A" "C" "C" "T"
    ## [35] "G"
    ## 
    ## [[10]]
    ##  [1] "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "A" "T" "T" "A" "G" "A" "C"
    ## [18] "C" "T" "G" "T" "T" "A" "G" "A" "C" "C" "T" "G" "G" "A" "C" "C" "T"
    ## [35] "G"
    ## 
    ## [[11]]
    ##  [1] "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "G"
    ## [18] "C" "C" "G" "G" "A" "A" "T" "A" "C"
    ## 
    ## [[12]]
    ##  [1] "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "A" "G" "A" "C" "C" "T" "G"
    ## [18] "C" "C" "G" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "C" "C" "G"
    ## 
    ## [[13]]
    ##  [1] "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "A" "G" "A" "C" "C" "T" "G"
    ## [18] "C" "C" "G" "C" "C" "G" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G"
    ## 
    ## [[14]]
    ##  [1] "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "G"
    ## [18] "C" "C" "G" "G" "A" "A" "T" "A" "C"
    ## 
    ## [[15]]
    ##  [1] "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "G" "A" "A" "C"
    ## [18] "T" "G" "C" "C" "G" "G" "A" "A"
    ## 
    ## [[16]]
    ##  [1] "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "C" "T" "G" "C"
    ## [18] "C" "G" "G" "A" "A" "G" "A" "A"
    ## 
    ## [[17]]
    ##  [1] "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "G" "A" "C" "C" "T" "G" "C"
    ## [18] "C" "G" "A" "G" "A" "C" "C" "T" "G" "C" "C" "G" "C" "T" "G" "C" "C"
    ## [35] "G"
    ## 
    ## [[18]]
    ##  [1] "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "G" "A" "C" "C" "T" "G" "C"
    ## [18] "C" "G" "C" "T" "G" "C" "C" "G" "A" "G" "A" "C" "C" "T" "G" "C" "C"
    ## [35] "G"
    ## 
    ## [[19]]
    ##  [1] "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "G" "C" "C" "G"
    ## [18] "G" "A" "A" "T" "A" "C" "G" "C" "C" "G" "G" "A" "A" "T" "A" "C"
    ## 
    ## [[20]]
    ##  [1] "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "C" "T" "G" "C" "C" "G" "G"
    ## [18] "A" "A" "C" "T" "G" "C" "C" "G" "G" "A" "A" "C" "T" "G" "C" "C" "G"
    ## [35] "G" "A" "A"
    ## 
    ## [[21]]
    ##  [1] "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "C" "T" "G" "C" "C" "G" "G"
    ## [18] "A" "A" "C" "T" "G" "C" "C" "G" "G" "A" "A" "C" "T" "G" "C" "C" "G"
    ## [35] "G" "A" "A"
    ## 
    ## [[22]]
    ##  [1] "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T" "A" "C" "G" "C" "C" "G"
    ## [18] "G" "A" "A" "T" "A" "C" "G" "C" "C" "G" "G" "A" "A" "T" "A" "C"
    ## 
    ## [[23]]
    ##  [1] "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T" "T" "A" "G" "A" "C" "C"
    ## [18] "T" "G" "T" "T" "A" "G" "A" "C" "C" "T" "G" "C" "T" "G"
    ## 
    ## [[24]]
    ##  [1] "C" "C" "T" "G" "C" "C" "G" "G" "A" "A" "T" "T" "A" "G" "A" "C" "C"
    ## [18] "T" "G" "C" "T" "G" "T" "T" "A" "G" "A" "C" "C" "T" "G"
