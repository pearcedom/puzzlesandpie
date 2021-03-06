Catalan Numbers and RNA Secondary Structure
================

[PUZZLE](http://rosalind.info/problems/cat/)

"In a given RNA strand, let the starting index be lo and the last index be hi. Let us call our function f(lo, hi). From lo, consider all the places where we could have a matching. This depends on the nucleotide, A to U, C to G and the reverse. So start iterating from lo + 1 till hi, and for every valid matching, say at position i, recursively calculate f(lo + 1, i - 1) and f(i + 1, hi). Then the total matchings are just f(lo + 1, i - 1) \* f(i + 1, hi).

To make the algorithm efficient, every time we calculate a value for a given lo and hi, we cache it in a dictionary. These values can then be recovered in constant time for further use."

#### Pseudocode

    f(lo, hi) =
        accumulator = 0
        for i = lo + 1 ... hi
            if char at i is valid:
                accumulator += f(lo + 1, i - 1) * f(i + 1, hi)
        return accumulator

#### Create a complement dataframe

``` r
pair_dfr <- data.frame(pair = c("U", "A", "C", "G"), stringsAsFactors = FALSE)
row.names(pair_dfr) <- c("A", "U", "G", "C")
```

    ##   pair
    ## A    U
    ## U    A
    ## G    C
    ## C    G

#### Function to check that a particular sequence satisfies the necessary requirements for perfect matching - i.e. it has an equal number of Gs & Cs as well as As and Us

``` r
checkSub <- function(sub) {
  all(
    identical(length(grep("A", sub)), length(grep("U", sub))),
    identical(length(grep("G", sub)), length(grep("C", sub)))
    )
}
```

#### Apply the pseudocode as actual code

``` r
count_nc <- function(rna){
    #print(rna)
    #the number of perfect matchings for a length 2 string will always be 1
    if(length(rna) <= 2) {
        return(1)
    #the result for a given string will be the same everytime, so if we've already computed it we can retrieve it from our records
    }
    #find all complement positions of a given nucleotide
    splits <- sapply(seq(2, length(rna), 2), function(i){
        if(pair_dfr[rna[1],] == rna[i] & checkSub(rna)) {
            i
        }
    }) %>% unlist()  
    #use these nucleotide pairs to excise the possible substrings and then perform the whole procedure again on these substrings!
    tally <- 0
    for(i in splits) {
        tally <- tally + sum(count_nc(rna[2:(i-1)]) * count_nc(rna[(i+1):length(rna)]))
    }
    tally
}
```

#### Works only for small strings

``` r
rna <- strsplit("CGAUAUCG", "")[[1]]
count_nc(rna)
```

    ## [1] 4
