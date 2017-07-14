Inferring Protein from Spectrum
================
Dominic Pearce

``` r
library(tidyverse)
library(knitr)
```

 

### Read in spectra and calculate the consecutive differences

``` r
L <- readLines("~/Downloads/rosalind_spec-4.txt") %>% as.numeric()
L[1:10]
```

    ##  [1] 4774.170 4902.229 4973.266 5076.275 5133.297 5261.392 5424.455
    ##  [8] 5571.523 5718.592 5821.601

 

``` r
#DON'T ROUND!
diffL <- diff(L)
diffL[1:10]
```

    ##  [1] 128.05858  71.03711 103.00919  57.02146 128.09496 163.06333 147.06841
    ##  [8] 147.06841 103.00919  99.06841

### Organise monoisotopic mass table

``` r
mmt <- data.frame(A = 71.03711, C = 103.00919, D = 115.02694, E = 129.04259, F = 147.06841, G = 57.02146, H = 137.05891, I = 113.08406, K = 128.09496, L = 113.08406, M = 131.04049, N = 114.04293, P = 97.05276, Q = 128.05858, R = 156.10111, S = 87.03203, T = 101.04768, V = 99.06841, W = 186.07931, Y = 163.06333) %>% t()
mmt %>% data.frame() %>% kable()
```

|     |          .|
|-----|----------:|
| A   |   71.03711|
| C   |  103.00919|
| D   |  115.02694|
| E   |  129.04259|
| F   |  147.06841|
| G   |   57.02146|
| H   |  137.05891|
| I   |  113.08406|
| K   |  128.09496|
| L   |  113.08406|
| M   |  131.04049|
| N   |  114.04293|
| P   |   97.05276|
| Q   |  128.05858|
| R   |  156.10111|
| S   |   87.03203|
| T   |  101.04768|
| V   |   99.06841|
| W   |  186.07931|
| Y   |  163.06333|

### Ask which amino acid our individual differences are closest to

``` r
sapply(diffL, function(diff)
    which.min(abs(diff - mmt[,1]))[1]
    ) %>%
    unlist() %>%
    names() %>%
    cat(sep = "")
```

    ## QACGKYFFCVNVMFRTTRNQIPVFIMSIPKDFVIPDIWNEWFVIHHDVYYVFWCIMIHNWDHYDTHHYWMIEPGGINFWNNVRDCFEIQYDRDSASVEM
