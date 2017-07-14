Counting Subsets
================

#### We want to count the total possible number of subsets of the set *{1,2,…,n}*. This can be represented using Pascal's Triangle. The key concept is that the empty set { } is counted in addition.

 

**{ }:**                               1          

**{1}:**                           1   1        

**{1, 2}:**                     1   2   1      

**{1, 2, 3}:**               1   3   3   1    

**{1, 2, 3, 4}:**         1   4   6   4   1  

 

#### But more simply is `2^n`. So, all we need are two variables, `n` to define our set (as 1 to n) and our modulo value which the answer format requires.

 

``` r
n <- 982
modu <- 1000000
```

 

#### `2^982` (`4.087481 x 10^295`) is too large for R to comprehend acurately so we have to incrementally calculate our answer, using the principle that `2^3 %% 1000000` is exactly the same as `(2*2 %% 1000000)*2 %% 1000000`.

 

``` r
output <- 1
for (i in rep(2, n)) {
  int <- output %% modu * (i %% modu)
  output <- int %% modu
}
output
```

    ## [1] 80704
