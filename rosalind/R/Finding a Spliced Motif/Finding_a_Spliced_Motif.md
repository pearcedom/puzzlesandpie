Finding a Spliced Motif
================
Dominic Pearce
14 April 2016

Method 1
--------

### Define sequence (`seq`) and subsequence (`subseq`)

#### `subseq` is split into individual nucleotides to be worked on one at a time in a loop

``` r
seq <- "ACGTACGTGACG"

subseq <- c("G", "T", "A")
```

 

### Loop over `subseq` to retrieve a vector of each nucleotides location**s** in seq

``` r
nuc.positions <- lapply(subseq, function(x) as.numeric(unlist(gregexpr(x, seq))))

nuc.positions
```

    ## [[1]]
    ## [1]  3  7  9 12
    ## 
    ## [[2]]
    ## [1] 4 8
    ## 
    ## [[3]]
    ## [1]  1  5 10

 

### Then we create a function that

#### - randomly samples each nucleotide's positions, one at a time and once for each nucleotide in subseq

#### - asks whether this random sampling is identical to its own ascending order-sorted brother

#### - if `TRUE` then great, that's our answer

#### - if `FALSE` then we repeat the procedure by calling the function `findPositions()` again, from within itself

#### - this will then repeat until a `TRUE` is achieved

``` r
findPositions <- function(x) {

  tmp.samp <- unlist(lapply(x, function(y) sample(y, 1)))

  if (identical(sort(tmp.samp), tmp.samp) == TRUE) {
    tmp.samp
  } else { findPositions(x)
  }
}
```

### The answer

``` r
findPositions(nuc.positions)
```

    ## [1]  7  8 10

 

### **BUT!** Disaster! This only works for the model data

    ## Warning in file(con, "r"): cannot open file 'C:/Users/domin/Downloads/
    ## rosalind_sseq (3).txt': No such file or directory

    ## Error in file(con, "r"): cannot open the connection

    ## Error in paste0(input[2:16], collapse = ""): object 'input' not found

    ## Error in paste(input[18:19], collapse = ""): object 'input' not found

    ## [1] 3 4 5

### The real data is too much for the computer to handle in this manner

#### (nice [**stack overflow**](http://stackoverflow.com) error message however)

Method 2
--------

### Same as before, up until the part where we need to get the ordered indicies

``` r
input <- readLines("~/Downloads/rosalind_sseq.txt")

seq <- paste0(input[2:16], collapse = "")
subseq <- strsplit(paste(input[18:19], collapse = ""), split = "")[[1]]

nuc.positions <- lapply(subseq, function(x) as.numeric(unlist(gregexpr(x, seq))))
```

 

#### This time we use a for loop where, for each of the indicies we simply grab the **smallest available that is higher than the previous index in the sequence**

#### This requires us to:

#### - first set a variable `index` with a 0 value otherwise the whole thing falls apart

#### - subset by values that are higher than zero (for the first iteration), and higher than the previous answer for the subsequent loops

#### - take the smallest index of that subset

``` r
index <- c(0)

for (i in 1:length(nuc.positions)) {

  sub.positions <- nuc.positions[[i]][which(nuc.positions[[i]] > index[length(index)])]

  index <- c(index, head(sub.positions, n = 1))
}


cat(index[-1])
```

    ## 2 6 10 15 16 20 22 25 26 35 38 40 41 44 45 49 57 58 60 65 70 74 80 81 90 97 99 101 106 117 122 123 129 134 136 142 147 155 156 160 167 172 175 180 182 186 187 195 196 197 200 206 212 214 217 221 225 228 235 240 245 246 248 251 255 268 280 296 298 300 314
