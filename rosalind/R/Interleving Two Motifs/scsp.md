Interleving Two Motifs
================
Dominic Pearce

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
library(tidyverse)
```

``` r
s <- "ATCTGAT" %>% strsplit("") %>% .[[1]] %>% c("", .)
t <- "TGCATAAT" %>% strsplit("") %>% .[[1]] %>% c("", .)
```

``` r
#START
if (s[2] == t[2]) {
    s = s
    t = t
    } else if (which(s[2] == t) %>% min > which(t[2] == s) %>% min) {
        t <- c(rep("", (which(t[2] == s) %>% min - 2)), t)
    } else {
        s <- c(rep("", (which(s[2] == t) %>% min - 2)), s)
    }
s
```

    ## [1] ""  "A" "T" "C" "T" "G" "A" "T"

``` r
t
```

    ##  [1] ""  ""  "T" "G" "C" "A" "T" "A" "A" "T"

``` r
#MIDDLE
x = max(max(which(s == "")), max(which(t == ""))) + 2
while(length(s[x:length(s)]) > 1 | length(t[x:length(t)]) > 1) {
    if (s[x] == t[x]) {
        s = s
        t = t
        x <- x + 1
        } else if (which(s[x] == t[x:length(t)]) %>% min > which(t[x] == s[x:length(s)]) %>% min) {
            t <- c(t[1:x-1], rep("", (which(t[x] == s[x:length(s)]) %>% min - 1)), t[x:length(t)])
            x <- max(max(which(s == "")), max(which(t == ""))) + 2
            } else {
                s <- c(s[1:x-1], rep("", (which(s[x] == t[x:length(t)]) %>% min - 1)), s[x:length(s)])
                x <- max(max(which(s == "")), max(which(t == ""))) + 2
            }
}
```

    ## Error in if (s[x] == t[x]) {: missing value where TRUE/FALSE needed

``` r
s
```

    ##  [1] ""  "A" "T" ""  "C" ""  "T" "G" "A" ""  "T"

``` r
t
```

    ##  [1] ""  ""  "T" "G" "C" "A" "T" ""  "A" "A" "T"

``` r
#END
s[which(s == "")] <- NA
t[which(t == "")] <- NA
if (!is.na(s[x] == t[x])) {
    if (length(s) > length(t)) {
        s <- c(s[1:x-1], NA, s[x:length(s)])
    } else if (length(t) > length(s)) {
        t <- c(t[1:x-1], NA, t[x:length(t)])
    }
    else {
        s = s
        t = t
    }
}
s
```

    ##  [1] NA  "A" "T" NA  "C" NA  "T" "G" "A" NA  "T"

``` r
t
```

    ##  [1] NA  NA  "T" "G" "C" "A" "T" NA  "A" "A" "T"

``` r
if (length(s) >= length(t)) {
    master <- s
    sub <- t
} else {
    master <- t
    sub <- s
}

map_chr(1:length(master), function(x) {
    ifelse(is.na(master[x]), sub[x], master[x])
    }) %>% .[-1] %>% paste0(collapse = "")
```

    ## [1] "ATGCATGAAT"
