Finding DNA Motifs
================
Finding DNA Motifs
5 February 2016

Data
----

``` r
haystack <- "GATATATGCATATACTT"
needle <- "ATAT"
```

Split into all possible sections of `length(needle)`
----------------------------------------------------

``` r
splits <- lapply(0:(nchar(haystack)-nchar(needle)), function(x)
  substring(haystack, seq((x+1), nchar(haystack), nchar(needle)),
            seq((x+nchar(needle)), nchar(haystack), nchar(needle))))

splits
```

    ## [[1]]
    ## [1] "GATA" "TATG" "CATA" "TACT" ""    
    ## 
    ## [[2]]
    ## [1] "ATAT" "ATGC" "ATAT" "ACTT"
    ## 
    ## [[3]]
    ## [1] "TATA" "TGCA" "TATA" ""    
    ## 
    ## [[4]]
    ## [1] "ATAT" "GCAT" "ATAC" ""    
    ## 
    ## [[5]]
    ## [1] "TATG" "CATA" "TACT" ""    
    ## 
    ## [[6]]
    ## [1] "ATGC" "ATAT" "ACTT"
    ## 
    ## [[7]]
    ## [1] "TGCA" "TATA" ""    
    ## 
    ## [[8]]
    ## [1] "GCAT" "ATAC" ""    
    ## 
    ## [[9]]
    ## [1] "CATA" "TACT" ""    
    ## 
    ## [[10]]
    ## [1] "ATAT" "ACTT"
    ## 
    ## [[11]]
    ## [1] "TATA" ""    
    ## 
    ## [[12]]
    ## [1] "ATAC" ""    
    ## 
    ## [[13]]
    ## [1] "TACT" ""    
    ## 
    ## [[14]]
    ## [1] "ACTT"

Find indices of `splits` where `needle` matches a `haystack` section
--------------------------------------------------------------------

``` r
split.index <- lapply(lapply(splits, function(x) x == needle), which)

split.index
```

    ## [[1]]
    ## integer(0)
    ## 
    ## [[2]]
    ## [1] 1 3
    ## 
    ## [[3]]
    ## integer(0)
    ## 
    ## [[4]]
    ## [1] 1
    ## 
    ## [[5]]
    ## integer(0)
    ## 
    ## [[6]]
    ## [1] 2
    ## 
    ## [[7]]
    ## integer(0)
    ## 
    ## [[8]]
    ## integer(0)
    ## 
    ## [[9]]
    ## integer(0)
    ## 
    ## [[10]]
    ## [1] 1
    ## 
    ## [[11]]
    ## integer(0)
    ## 
    ## [[12]]
    ## integer(0)
    ## 
    ## [[13]]
    ## integer(0)
    ## 
    ## [[14]]
    ## integer(0)

Transform `splits` indices to `haystack` indices
------------------------------------------------

``` r
unique(unlist(sapply(1:length(split.index),
                     function(y) sapply(split.index[[y]],
                                        function(x) y + (x-1)*nchar(needle) ))))[order(unique(unlist(sapply(1:length(split.index),
                     function(y) sapply(split.index[[y]],
                                        function(x) y + (x-1)*nchar(needle) )))))]
```

    ## [1]  2  4 10
