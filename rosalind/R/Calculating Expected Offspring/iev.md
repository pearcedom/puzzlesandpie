Calculating Expected Offspring
================
Dominic Pearce
16 February 2016

 

Given a parent-couple population defined by the order:

1.  AA-AA
2.  AA-Aa
3.  AA-aa
4.  Aa-Aa
5.  Aa-aa
6.  aa-aa

Return the expected number of dominant offspring, given 2 children per parent-couple

 

### Libraries

``` r
library(knitr) #for prettier markdown tables
```

 

First create a `data.frame()` with the probabilities of each parent-couple having a dominant child
--------------------------------------------------------------------------------------------------

``` r
probfreq.tbl <- data.frame(p.genotype = c("AA-AA", "AA-Aa", "AA-aa", "Aa-Aa", "Aa-aa", "aa-aa"), prob.dom = c(1, 1, 1, 0.75, 0.5, 0))

kable(probfreq.tbl)
```

| p.genotype |  prob.dom|
|:-----------|---------:|
| AA-AA      |      1.00|
| AA-Aa      |      1.00|
| AA-aa      |      1.00|
| Aa-Aa      |      0.75|
| Aa-aa      |      0.50|
| aa-aa      |      0.00|

 

Then add our parent-couple frequencies
--------------------------------------

### and multiply by two to get the number of children

``` r
probfreq.tbl$pop.freq <-  as.numeric(strsplit(readLines("~/Downloads/rosalind_iev.txt"), " ")[[1]])

probfreq.tbl$children <- probfreq.tbl$pop.freq*2

kable(probfreq.tbl)
```

| p.genotype |  prob.dom|  pop.freq|  children|
|:-----------|---------:|---------:|---------:|
| AA-AA      |      1.00|     18687|     37374|
| AA-Aa      |      1.00|     19730|     39460|
| AA-aa      |      1.00|     19612|     39224|
| Aa-Aa      |      0.75|     18636|     37272|
| Aa-aa      |      0.50|     18154|     36308|
| aa-aa      |      0.00|     17286|     34572|

 

Multiply offspring frequencies by likelyhood of dominant offspring and `Sum()`
------------------------------------------------------------------------------

``` r
probfreq.tbl$children.dom <- probfreq.tbl$prob.dom * probfreq.tbl$children

kable(probfreq.tbl)
```

| p.genotype |  prob.dom|  pop.freq|  children|  children.dom|
|:-----------|---------:|---------:|---------:|-------------:|
| AA-AA      |      1.00|     18687|     37374|         37374|
| AA-Aa      |      1.00|     19730|     39460|         39460|
| AA-aa      |      1.00|     19612|     39224|         39224|
| Aa-Aa      |      0.75|     18636|     37272|         27954|
| Aa-aa      |      0.50|     18154|     36308|         18154|
| aa-aa      |      0.00|     17286|     34572|             0|

``` r
sum(probfreq.tbl$children.dom)
```

    ## [1] 162166

 

Clean code
----------

``` r
probfreq.tbl <- data.frame(p.genotype = c("AA-AA", "AA-Aa", "AA-aa", "Aa-Aa", "Aa-aa", "aa-aa"),
                           prob.dom = c(1, 1, 1, 0.75, 0.5, 0),
                           pop.freq =  as.numeric(strsplit(readLines("~/Downloads/rosalind_iev.txt"), " ")[[1]]))

probfreq.tbl$children <- probfreq.tbl$pop.freq*2

sum(probfreq.tbl$prob.dom * probfreq.tbl$children)
```
