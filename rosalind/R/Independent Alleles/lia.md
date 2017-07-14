Independent Alleles
================
Dominic A. Pearce
6 April 2016

First, our input
----------------

``` r
k <- 4
N <- 7
```

Generation 1
------------

### Simulate our first generation

#### Using 1, 2, 10 & 20 allow us to decipher the genotype simply by summing

``` r
g1 <- data.frame(replicate(2, c(c(sample(c(20, 10), 1),
                                  sample(c(20, 10), 1)),
                                c(sample(c(2, 1), 1),
                                  sample(c(2, 1), 1)))))

kable(g1)
```

|   X1|   X2|
|----:|----:|
|   20|   20|
|   10|   10|
|    1|    1|
|    1|    1|

``` r
sapply(g1, sum)
```

    ## X1 X2 
    ## 32 32

Generation 2
------------

### Simulate our second generation

``` r
g2 <- sapply(g1, function(x) data.frame(replicate(2,
                                                  c(c(sample(x[1:2], 1),
                                                      sample(c(20, 10), 1)),
                                                    c(sample(x[3:4], 1),
                                                      sample(c(2, 1), 1))))))

g2
```

    ##    X1        X2       
    ## X1 Numeric,4 Numeric,4
    ## X2 Numeric,4 Numeric,4

``` r
kable(data.frame(matrix(unlist(g2), ncol = length(g2))) )
```

|   X1|   X2|   X3|   X4|
|----:|----:|----:|----:|
|   10|   10|   20|   20|
|   10|   20|   20|   20|
|    1|    1|    1|    1|
|    2|    2|    2|    1|

#### ...and so on for as many generations as necessary

With replication
----------------

### To get our probabilities, we simply wrap it in `replicate()` and repeat the process 10,000x

#### The tricky part is getting the replication to work with however many generations are specified. We manage this by using a for loop

``` r
  g <- list(data.frame(replicate(2, c(c(sample(c(20, 10), 1), sample(c(20, 10), 1)), c(sample(c(2, 1), 1), sample(c(2, 1), 1))))))


offsprings <- data.frame(replicate(10000, {

  for (i in 2:k) {

    g.tmp <- sapply(g[[i-1]], function(x) data.frame(replicate(2, c(c(sample(x[1:2], 1), sample(c(20, 10), 1)), c(sample(x[3:4], 1), sample(c(2, 1), 1))))))

  g[[i]] <- data.frame(matrix(unlist(g.tmp), ncol = length(g.tmp)))
  }

  sapply(g[[k]], sum)
  }))
```

Calculating the probability
---------------------------

### We then count the occurrences where our summed values equal 33

#### This will only be '1, 2, 10, 20' geneotypes, and agnostic of order

``` r
are.het <- data.frame(sapply(offsprings, function(x) x == 33))

kable(are.het[1:10])
```

| X1    | X2    | X3    | X4    | X5    | X6    | X7    | X8    | X9    | X10   |
|:------|:------|:------|:------|:------|:------|:------|:------|:------|:------|
| FALSE | TRUE  | FALSE | FALSE | FALSE | TRUE  | TRUE  | FALSE | FALSE | FALSE |
| FALSE | FALSE | FALSE | FALSE | TRUE  | FALSE | FALSE | TRUE  | FALSE | FALSE |
| FALSE | FALSE | FALSE | TRUE  | TRUE  | FALSE | TRUE  | TRUE  | FALSE | FALSE |
| TRUE  | TRUE  | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | TRUE  | FALSE |
| TRUE  | FALSE | FALSE | TRUE  | TRUE  | FALSE | FALSE | FALSE | FALSE | TRUE  |
| TRUE  | FALSE | FALSE | FALSE | FALSE | FALSE | TRUE  | FALSE | FALSE | FALSE |
| FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE |
| TRUE  | TRUE  | TRUE  | TRUE  | FALSE | TRUE  | FALSE | FALSE | FALSE | FALSE |
| FALSE | FALSE | FALSE | TRUE  | FALSE | FALSE | TRUE  | FALSE | TRUE  | FALSE |
| FALSE | FALSE | TRUE  | FALSE | TRUE  | FALSE | FALSE | TRUE  | FALSE | TRUE  |
| FALSE | FALSE | FALSE | TRUE  | TRUE  | TRUE  | FALSE | FALSE | FALSE | FALSE |
| FALSE | TRUE  | FALSE | FALSE | FALSE | TRUE  | FALSE | FALSE | FALSE | FALSE |
| FALSE | FALSE | FALSE | FALSE | TRUE  | FALSE | FALSE | FALSE | FALSE | TRUE  |
| TRUE  | FALSE | FALSE | FALSE | TRUE  | FALSE | TRUE  | FALSE | FALSE | FALSE |
| FALSE | TRUE  | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE | FALSE |
| TRUE  | FALSE | FALSE | FALSE | FALSE | TRUE  | FALSE | FALSE | TRUE  | TRUE  |

### And check that there are at least N occurences of 33

``` r
per.gen <- sapply(are.het, function(x) length(which(x == TRUE)) >= N)

per.gen[1:10]
```

    ##    X1    X2    X3    X4    X5    X6    X7    X8    X9   X10 
    ## FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE

### Finally calculate the probability

``` r
sum(per.gen)/ ncol(are.het)
```

    ## [1] 0.0792

CAVEAT
------

### My answers are **WRONG**

``` r
pbinom(N-1, 2^k, 0.25, lower.tail=F)
```

    ## [1] 0.07955725
