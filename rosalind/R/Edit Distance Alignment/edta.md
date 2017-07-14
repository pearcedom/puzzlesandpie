Edit Distance Alignment
================
Dominic Pearce

#### We're able to build on our minimal edit function from last week. First we need to return our completed `edit_mtx`

``` r
editDistance <- function(s, t){
  mtxDefine <- function(s, t){
      s_len <- length(s)
      t_len <- length(t)
      edit_mtx <- matrix(rep(0, ((s_len+1)*(t_len+1))), nrow =    t_len+1, ncol = s_len+1)
      edit_mtx[1,] <- 0:s_len
      edit_mtx[,1] <- 0:t_len
      colnames(edit_mtx) <- c("0", s)
      row.names(edit_mtx) <- c("0", t)
      edit_mtx
  }
    edit_mtx <- mtxDefine(s, t)
    for(i in 1:length(t)){
        for(j in 1:length(s)){
            if(s[j] == t[i]){
                edit_mtx[i+1, j+1] <- edit_mtx[i, j]
            } else {
                edit_mtx[i + 1, j + 1] <- min(edit_mtx[i, j], edit_mtx[i, j+1], edit_mtx[i+1, j]) + 1
            }
        }
    }
    edit_mtx
}
```

``` r
t <- "PRETTY" %>% strsplit("") %>% .[[1]]
s <- "PRTTEIN" %>% strsplit("") %>% .[[1]]
```

``` r
mtx <- editDistance(s, t) %>% print
```

    ##   0 P R T T E I N
    ## 0 0 1 2 3 4 5 6 7
    ## P 1 0 1 2 3 4 5 6
    ## R 2 1 0 1 2 3 4 5
    ## E 3 2 1 1 2 2 3 4
    ## T 4 3 2 1 1 2 3 4
    ## T 5 4 3 2 1 2 3 4
    ## Y 6 5 4 3 2 2 3 4

``` r
lst <- list(c(), c())

i <- ncol(mtx)
j <- nrow(mtx)
x <- length(s)
y <- length(t)
```

``` r
while (i > 0){
    if (s[x] != t[y]){
        if (mtx[j-1, i-1] > min(mtx[j-1, i], mtx[j, i-1])){
            lst[[1]] <- c(s[x], lst[[1]])
            lst[[2]] <- c(t[y], lst[[2]])
            i <- i - 1
            #j <- j - 1
            x <- x - 1
            y <- y - 1
        } else if (mtx[j-1, i] > mtx[j, i-1]){
            lst[[1]] <- c(s[x], lst[[1]])
            lst[[2]] <- c("-", lst[[2]])
            i <- i - 1
            j <- j - 1
            x <- x - 1
        } else if (mtx[j-1, i] <= mtx[j, i-1]){
            lst[[1]] <- c("-", lst[[1]])
            lst[[2]] <- c(t[y], lst[[2]])
            i <- i - 1
            j <- j - 1
            y <- y - 1
        }
    } else {
      lst[[1]] <- c(s[x], lst[[1]])
      lst[[2]] <- c(t[y], lst[[2]])
      i <- i - 1
      j <- j - 1
      x <- x - 1
      y <- y - 1
    }
}

lst
```

    ## [[1]]
    ## [1] "P" "R" "-" "T" "T" "E" "I" "N"
    ## 
    ## [[2]]
    ## [1] "P" "R" "E" "T" "T" "Y" "-" "-"
