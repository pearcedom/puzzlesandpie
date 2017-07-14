Matching Random Motifs
================
Dominic Pearce

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
library(tidyverse)
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
ori <- strsplit("ATAGCCGA", "")[[1]]
gc <- 0.6
nuc <- c("A", "C", "G", "T")

rep_vec <- replicate(100,
    replicate(90000,
        sample(nuc,
            8,
            replace = TRUE,
            prob = c((1-gc)/2, gc/2, gc/2, (1-gc)/2))) %>%
    data.frame(stringsAsFactors = FALSE) %>%
    sapply(function(x) identical(x, ori)) %>% sum
    )
sum(rep_vec > 0) / length(rep_vec)
```

    ## [1] 0.7
