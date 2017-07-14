rear
================
Dominic Pearce

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
library(tidyverse)
library(knitr)
```

``` r
library(tidyverse)
```

Reversal Distance
=================

Workings
--------

### Function to normalise `s` to `1:n`

``` r
normaliseSequential <- function(s, t) {
    #i.e. if 312 were transformed to 123, calculate what would 231 become
    lapply(1:length(s), function(x){
        which(t == s[x])
        }) %>% unlist
    }
```

### Function to calculate all reversals

``` r
allReversals <- function(t) {
    #for reversal size
    map(2:(anchor_pos-1), function(r_size){
        #calculate the reversal for each position possible
        map(2:(len-r_size), function(x) {
            reversal <- c(t[1:(x-1)], rev(t[x:(x+r_size-1)]), t[(x+r_size):len])
            reversal
            })
        }) %>% unlist(recursive = FALSE)
}
```

### Assign a bunch of variables

``` r
#Rosalind style input
s_base <- c(3, 9, 10, 4, 1, 8, 6, 7, 5, 2)
t_base <- c(2, 9,  8, 5, 1, 7, 3, 4, 6, 10)
#Value of trailing anchor
anchor_pos <- length(s_base) + 1

#Normalise to 1:n
s <- s_base %>% sort %>% c(0, ., anchor_pos)
t <- normaliseSequential(s_base, t_base)

#Anchor t with flanking 0 and n+1
t_current <- c(0, t, anchor_pos)
len <- length(t_current)
```

### Calculate the number of reversals

``` r
num_rev <- 0
while(!identical(t_current, s)){
    #Calculate all reversals
    rev_lst <- allReversals(t_current)
    #Select best reversal based on minimal break points
    break_n <- lapply(rev_lst, function(x) which(abs(diff(x)) != 1) %>% length)
    t_current <- rev_lst[[which.min(break_n)]]
    #Housekeeping
    num_rev <- num_rev + 1
    print(t_current)
}
```

    ##  [1]  0  7  2 10  8  9  3  5  6  4  1 11
    ##  [1]  0  7  2  1  4  6  5  3  9  8 10 11
    ##  [1]  0  7  2  1  4  5  6  3  9  8 10 11
    ##  [1]  0  7  6  5  4  1  2  3  9  8 10 11
    ##  [1]  0  7  6  5  4  1  2  3  8  9 10 11
    ##  [1]  0  7  6  5  4  3  2  1  8  9 10 11
    ##  [1]  0  1  2  3  4  5  6  7  8  9 10 11

``` r
print(paste0("Number of reversals = ", num_rev))
```

    ## [1] "Number of reversals = 7"

Real data
---------

### Input

``` r
input <- read.csv("~/Downloads/rosalind_rear-5.txt", header = FALSE, sep = " ") %>% t %>% data.frame
input %>% kable
```

|     |   X1|   X2|   X3|   X4|   X5|   X6|   X7|   X8|   X9|  X10|
|-----|----:|----:|----:|----:|----:|----:|----:|----:|----:|----:|
| V1  |    6|    5|    5|    3|    6|   10|    8|    1|    7|   10|
| V2  |    1|    6|    7|   10|    1|    3|    9|    3|    5|    4|
| V3  |    5|    8|   10|    5|    8|    9|    7|   10|    6|    3|
| V4  |   10|    1|    3|    8|    5|    4|    5|    6|    4|    6|
| V5  |    8|    4|    9|    6|    3|    1|    1|    7|    3|    7|
| V6  |    3|   10|    2|    7|    2|    2|   10|    8|    2|    8|
| V7  |    4|    7|    6|    2|   10|    7|    4|    2|   10|    1|
| V8  |    2|    3|    4|    1|    4|    8|    6|    4|    1|    2|
| V9  |    7|    9|    1|    4|    9|    5|    2|    9|    9|    5|
| V10 |    9|    2|    8|    9|    7|    6|    3|    5|    8|    9|

### Calculation

#### Which doesn't work...

``` r
lapply(seq(1, nrow(input), 2), function(x) {
    s_base <- input[[x]]
    t_base <- input[[x+1]]
    anchor_pos <- length(s_base) + 1

    s <- s_base %>% sort %>% c(0, ., anchor_pos)
    t <- normaliseSequential(s_base, t_base)
    t_current <- c(0, t, anchor_pos)
    len <- length(t_current)

    num_rev <- 0
    while(!identical(t_current, s)){
        rev_lst <- allReversals(t_current)
        break_n <- lapply(rev_lst, function(x) which(abs(diff(x)) != 1) %>% length)
        t_current <- rev_lst[[which.min(break_n)]]
        num_rev <- num_rev + 1
    }
    num_rev

    }) %>% unlist
```

    ## [1] 9 7 6 6 7
