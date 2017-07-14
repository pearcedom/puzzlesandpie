# Variables (from Rosalind)
months = 33
litter_size = 3

# Function to calculate number of rabbits alive at a given month
def rabbitsAlive(months, litter_size):
    nrabs = [1, 1]
    for i in range(3, months + 1):
        nrabs.append(nrabs[i-2] + (nrabs[i-3] * litter_size))
    return(nrabs)

# The answer
out = rabbitsAlive(33, 3)

print(out[-1])
