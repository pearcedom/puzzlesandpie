function sumDiffs(until)
    sum(1:until)^2 - sum([i^2 for i in 1:until])
end

sumDiffs(100)
