# Theoretical Probability Distributions: In particular, uses of the Binom distribution 

p_succ <- 0.5
p_fail <- 1 - p_succ 

n_trials <- 2

obs_succ <- 2
obs_fails <- n_trials - obs_succ

# The probability of obs obs_succ with p_succ
p_succ^obs_succ

# 0 succ ... n succ
p_succ^0

0.5 ^ n_success # 3 heads

# r* = random 
rbinom(n = 10, size = 2, prob = c(0.9, 0.1))
# eg rnorm, runif, rt
# d* = dist, n trials, p_succ 0.5
n <- 12
obs <- 11 
dbinom(obs, size = n, prob = c(0.5)) # exactly _obs_ success
# What's the prob of getting 8 successes *or something more extreme* successes
sum(dbinom(obs:n, size = n, prob = c(0.5))) # _obs_ successes  to the most exteme
0:n
n*p_succ # Center, the most common outcome
obs - n*p_succ # How far away we are (Signal)
# where we are 
right_side <- obs # n*p_succ + (obs - n*p_succ) # where we are
left_side <- n*p_succ - (obs - n*p_succ) # this is just as "extreme"

# So from above we can also say:
obs_ormore <- sum(dbinom(right_side:n, size = n, prob = 0.5)) # _obs_ successes  to the most exteme
opposite_orless <- sum(dbinom(0:left_side, size = n, prob = 0.5)) # _obs_ successes  to the most exteme

obs_ormore + opposite_orless

# 0.006 - The probability of observing _obs_ -- or more exreme -- successes in
# n trials with a p_succ
binom.test(x = obs, n = n, p = p_succ)


# What about 1 success form n = 10, when we expect 9?
n <- 10
p_succ <- 0.9
dist <- dbinom(0:n, size = n, prob = p_succ) 
barplot(dist)

obs <- 1
sum(dbinom(0:obs, size = n, prob = p_succ))
binom.test(x = obs, n = n, p = p_succ, alternative = "less")

# Calculate the cumulative sum of the dist's probabilities
cumu_dist <- cumsum(dist)
plot(cumu_dist, type = "S")
cumu_dist < 0.05


# p* = prob
# provided the value on x, what proportion of the
# entire dist (beginning from the left)  has been covered 
# until that point - i.e. the cumsum(dist)
pbinom(q = c(0, 1, 2), size = 2, prob = 0.5)

# q* = quantiles
# given the proportion of dist covered, what is the value
# on the x?
qbinom(p = c(0.25, 0.75, 1.0), size = 2, prob = 0.5)

