Finding a Shared Motif
================
Dominic Pearce
9 March 2016

``` r
#library(seqinr)
#asdf <- read.fasta("~/Downloads/rosalind_lcsm.txt")

#qwer <- unlist(lapply(asdf, function(x) paste0(x, collapse = "")))

input.lst <- list(">Rosalind_1 GATTACA", ">Rosalind_2 TAGACCA", ">Rosalind_3 ATACA")

nt = sapply(input.lst, function(x) substr(x, (which(strsplit(x, "")[[1]] == " ") + 1), nchar(x)))

nt
```

    ## [1] "GATTACA" "TAGACCA" "ATACA"

Chomper function
----------------

``` r
pieces <- function(nt.seq){

  lil.bits <- as.vector(sapply(1:nchar(nt.seq), function(x) sapply(1:nchar(nt.seq), function(y) substr(nt.seq, x, y))))

  blanks <- which(lil.bits == "")
  singles <- which(nchar(lil.bits) == 1)

  lil.bits[-c(blanks, singles)]
}
```

Do the chomping
---------------

``` r
#rewq <- lapply(nt, pieces)

all.pieces.lst <- lapply(nt, pieces)

all.pieces.lst
```

    ## [[1]]
    ##  [1] "GA"      "GAT"     "GATT"    "GATTA"   "GATTAC"  "GATTACA" "AT"     
    ##  [8] "ATT"     "ATTA"    "ATTAC"   "ATTACA"  "TT"      "TTA"     "TTAC"   
    ## [15] "TTACA"   "TA"      "TAC"     "TACA"    "AC"      "ACA"     "CA"     
    ## 
    ## [[2]]
    ##  [1] "TA"      "TAG"     "TAGA"    "TAGAC"   "TAGACC"  "TAGACCA" "AG"     
    ##  [8] "AGA"     "AGAC"    "AGACC"   "AGACCA"  "GA"      "GAC"     "GACC"   
    ## [15] "GACCA"   "AC"      "ACC"     "ACCA"    "CC"      "CCA"     "CA"     
    ## 
    ## [[3]]
    ##  [1] "AT"    "ATA"   "ATAC"  "ATACA" "TA"    "TAC"   "TACA"  "AC"   
    ##  [9] "ACA"   "CA"

Arrange as one object and count common substrings with `table()`
----------------------------------------------------------------

``` r
#poiu <- unlist(rewq)

all.pieces <- unlist(all.pieces.lst)

all.pieces
```

    ##  [1] "GA"      "GAT"     "GATT"    "GATTA"   "GATTAC"  "GATTACA" "AT"     
    ##  [8] "ATT"     "ATTA"    "ATTAC"   "ATTACA"  "TT"      "TTA"     "TTAC"   
    ## [15] "TTACA"   "TA"      "TAC"     "TACA"    "AC"      "ACA"     "CA"     
    ## [22] "TA"      "TAG"     "TAGA"    "TAGAC"   "TAGACC"  "TAGACCA" "AG"     
    ## [29] "AGA"     "AGAC"    "AGACC"   "AGACCA"  "GA"      "GAC"     "GACC"   
    ## [36] "GACCA"   "AC"      "ACC"     "ACCA"    "CC"      "CCA"     "CA"     
    ## [43] "AT"      "ATA"     "ATAC"    "ATACA"   "TA"      "TAC"     "TACA"   
    ## [50] "AC"      "ACA"     "CA"

``` r
table(all.pieces)
```

    ## all.pieces
    ##      AC     ACA     ACC    ACCA      AG     AGA    AGAC   AGACC  AGACCA 
    ##       3       2       1       1       1       1       1       1       1 
    ##      AT     ATA    ATAC   ATACA     ATT    ATTA   ATTAC  ATTACA      CA 
    ##       2       1       1       1       1       1       1       1       3 
    ##      CC     CCA      GA     GAC    GACC   GACCA     GAT    GATT   GATTA 
    ##       1       1       2       1       1       1       1       1       1 
    ##  GATTAC GATTACA      TA     TAC    TACA     TAG    TAGA   TAGAC  TAGACC 
    ##       1       1       3       2       2       1       1       1       1 
    ## TAGACCA      TT     TTA    TTAC   TTACA 
    ##       1       1       1       1       1

Then subset by only those substrings found in each of the original strings and choose the longest
-------------------------------------------------------------------------------------------------

``` r
#uiop <- table(poiu)[table(poiu) == length(qwer)]

common.pieces <- table(all.pieces)[table(all.pieces) == length(nt)]

common.pieces
```

    ## all.pieces
    ## AC CA TA 
    ##  3  3  3

``` r
#names(uiop[which.max(nchar(names(uiop)))])

names(common.pieces[which.max(nchar(names(common.pieces)))])
```

    ## [1] "AC"
