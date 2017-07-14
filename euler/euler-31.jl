#=
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

How many different ways can £2 be made using any number of coins?

=#


#...brute force, I'm sick

counter = 0
@time for p1 in 0:200 #169 seconds
    for p2 in 0:100
        for p5 in 0:40
            for p10 in 0:20
                for p20 in 0:10
                    for p50 in 0:4
                        for p100 in 0:2
                            for p200 in 0:1
                                if p1*1 + p2*2 + p5*5 + p10*10 + p20*20 + p50*50 + p100*100 + p200*200 == 200
                                    counter +=1
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
counter
