k-Mer Composition
================

``` r
library(tidyverse)
library(combinat)
library(seqinr)
```

``` r
s <- "CTTCGAAAGTTTGGGCCGAGTCTTACAGTCGGTCTTGAAGCAAAGTAACGAACTCCACGGCCCTGACTACCGAACCAGTTGTGAGTACTCAACTGGGTGAGAGTGCAGTCCCTATTGAGTTTCCGAGACTCACCGGGATTTTCGATCCAGCCTCAGTCCAGTCTTGTGGCCAACTCACCAAATGACGTTGGAATATCCCTGTCTAGCTCACGCAGTACTTAGTAAGAGGTCGCTGCAGCGGGGCAAGGAGATCGGAAAATGTGCTCTATATGCGACTAAAGCTCCTAACTTACACGTAGACTTGCCCGTGTTAAAAACTCGGCTCACATGCTGTCTGCGGCTGGCTGTATACAGTATCTACCTAATACCCTTCAGTTCGCCGCACAAAAGCTGGGAGTTACCGCGGAAATCACAG" %>% strsplit(., "") %>% .[[1]]
```

``` r
nucs <- c("A", "T", "G", "C")

combinations <- replicate(100000, 
          paste0(sample(nucs, replace = TRUE), collapse = "")
          ) %>% 
  unique() %>% 
  sort()
```

``` r
kmers <- sapply(1:(length(s)-3), function(x) {
  s[x:(x+3)] %>% paste0(collapse = "")
})

sapply(combinations, function(x) {
  sum(kmers == x)
})
```

    ## AAAA AAAC AAAG AAAT AACA AACC AACG AACT AAGA AAGC AAGG AAGT AATA AATC AATG 
    ##    4    1    4    3    0    1    1    5    1    3    1    2    2    1    2 
    ## AATT ACAA ACAC ACAG ACAT ACCA ACCC ACCG ACCT ACGA ACGC ACGG ACGT ACTA ACTC 
    ##    0    1    1    3    1    2    1    3    1    1    1    1    2    2    5 
    ## ACTG ACTT AGAA AGAC AGAG AGAT AGCA AGCC AGCG AGCT AGGA AGGC AGGG AGGT AGTA 
    ##    1    3    0    2    2    1    1    1    1    3    1    0    0    1    5 
    ## AGTC AGTG AGTT ATAA ATAC ATAG ATAT ATCA ATCC ATCG ATCT ATGA ATGC ATGG ATGT 
    ##    5    1    5    0    2    0    2    1    2    1    1    1    2    0    1 
    ## ATTA ATTC ATTG ATTT CAAA CAAC CAAG CAAT CACA CACC CACG CACT CAGA CAGC CAGG 
    ##    0    0    1    1    3    2    1    0    3    2    3    0    0    2    0 
    ## CAGT CATA CATC CATG CATT CCAA CCAC CCAG CCAT CCCA CCCC CCCG CCCT CCGA CCGC 
    ##    8    0    0    1    0    2    1    3    0    0    0    1    4    3    2 
    ## CCGG CCGT CCTA CCTC CCTG CCTT CGAA CGAC CGAG CGAT CGCA CGCC CGCG CGCT CGGA 
    ##    1    1    3    1    2    1    3    1    2    1    2    1    1    1    2 
    ## CGGC CGGG CGGT CGTA CGTC CGTG CGTT CTAA CTAC CTAG CTAT CTCA CTCC CTCG CTCT 
    ##    3    2    1    1    0    1    1    3    2    1    2    6    2    1    1 
    ## CTGA CTGC CTGG CTGT CTTA CTTC CTTG CTTT GAAA GAAC GAAG GAAT GACA GACC GACG 
    ##    1    2    3    3    3    2    3    0    3    2    1    1    0    0    1 
    ## GACT GAGA GAGC GAGG GAGT GATA GATC GATG GATT GCAA GCAC GCAG GCAT GCCA GCCC 
    ##    4    3    0    1    5    0    2    0    1    2    1    3    0    1    2 
    ## GCCG GCCT GCGA GCGC GCGG GCGT GCTA GCTC GCTG GCTT GGAA GGAC GGAG GGAT GGCA 
    ##    2    1    1    0    3    0    0    4    5    0    3    0    2    1    1 
    ## GGCC GGCG GGCT GGGA GGGC GGGG GGGT GGTA GGTC GGTG GGTT GTAA GTAC GTAG GTAT 
    ##    3    0    3    2    2    1    1    0    2    1    0    2    2    1    2 
    ## GTCA GTCC GTCG GTCT GTGA GTGC GTGG GTGT GTTA GTTC GTTG GTTT TAAA TAAC TAAG 
    ##    0    2    2    5    2    2    1    1    2    1    2    2    2    2    1 
    ## TAAT TACA TACC TACG TACT TAGA TAGC TAGG TAGT TATA TATC TATG TATT TCAA TCAC 
    ##    1    3    4    0    2    1    1    0    1    2    2    1    1    1    5 
    ## TCAG TCAT TCCA TCCC TCCG TCCT TCGA TCGC TCGG TCGT TCTA TCTC TCTG TCTT TGAA 
    ##    2    0    3    2    1    1    2    2    3    0    3    0    1    3    1 
    ## TGAC TGAG TGAT TGCA TGCC TGCG TGCT TGGA TGGC TGGG TGGT TGTA TGTC TGTG TGTT 
    ##    2    3    0    2    1    2    2    1    2    3    0    1    2    3    1 
    ## TTAA TTAC TTAG TTAT TTCA TTCC TTCG TTCT TTGA TTGC TTGG TTGT TTTA TTTC TTTG 
    ##    1    3    1    0    1    1    3    0    2    1    2    2    0    2    1 
    ## TTTT 
    ##    1
