solveCollatz <- function(n){
    seq <- c(n)
    while (n > 1){
        if (n %% 2 == 0){
            n = n / 2
        } else {
            n = 3*n + 1
        }
    seq <- c(seq, n)
    }
    seq
}

start = Sys.time()
asdf <- lapply(1:999999, function(x) {
    length(solveCollatz(x))
})
Sys.time() - start
# 5.6 minutes!