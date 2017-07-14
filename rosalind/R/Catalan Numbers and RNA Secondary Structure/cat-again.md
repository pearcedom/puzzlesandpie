Catalan numbers again
================
Dominic Pearce

``` r
catN <- function(n) {
    factorial(2*n) / (factorial(n+1) * factorial(n))
}

cat_dfr <- lapply(1:10, function(n) {
    data.frame(n = n, catalan = catN(n))
}) %>% do.call(rbind, .)
```

|    n|  catalan|
|----:|--------:|
|    1|        1|
|    2|        2|
|    3|        5|
|    4|       14|
|    5|       42|
|    6|      132|
|    7|      429|
|    8|     1430|
|    9|     4862|
|   10|    16796|

#### AUAUGCCGAUUA

##### 5

#### AUAUGCAUGCAU

##### 19

#### GCAUAUAUAUUAGC

##### 28

#### AUGCUUAAGCAUGCAU

##### 16

#### GCGCGCAU

##### 5

#### GCAUAUAUUAGC

##### 10
