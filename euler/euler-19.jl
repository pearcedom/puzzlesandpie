#=
You are given the following information, but you may prefer to do some research for yourself.
1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=#

## The smallest repeating unit is 4 years, if we figure out the month lengths for that period we can scale it up to the hundred years
#month lengths in a regular year
mon_len = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

#month lengths in a leap year
leap_len = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

#repeating 3xnormal 1xleap pattern
mon_all = append!(repeat(mon_len, outer = 3), leap_len)

#that repeating pattern for the century
cen_len = repeat(mon_all, outer = 25)

## Then we make a dictionary that, if we give it a date post-dec-31-1900 it can give us the day
# e.g. given then first is a Tuesday, the 25th can be determined by 25 % 7 = 4 => it must be a friday
dict = Dict(zip([1, 2, 3, 4, 5, 6, 0], ["tu", "w", "th", "f", "sa", "su", "mo"]))

## Finally we work out the sequence of days for the century (i.e. tuesday-monday repeating) and combine that with our month length vector to give us which days were the first of the month

#get the sequence of days
day_seq = [dict[i % 7] for i in 1:sum(cen_len)]

#then use that sequence and the month length array to determine which days fell on the 1st of the month, and which were sundays
sum(day_seq[sum(cen_len[1:i]) + 1] == "su" for i in 0:length(cen_len)-1)


