# Demonstrating the Normal distribution

# Begin with a large number of values, randomly Normally distributed
site_I <- rnorm(10^8, mean = 200, sd = 6) # as if from site I

# sort(site_I)
range(site_I)

# Use z-scores to rescale onto the standard normal distributuion
# mu = 0, sigma = 1
site_I_z <- scale(site_I)[,1]

# approximately 5% will be beyond [-1.96, 1.96]
sum(site_I_z < -1.96 | site_I_z > 1.96) # below 3 z_score

# How does that function work?
# Check out the type of the data
typeof(site_I_z) # Numerical (double) vector
typeof(site_I_z < -1.96) # Logical (T/F, 1/0) vector
sum(site_I_z < -1.96) # Apply a sum function to a Logical vector - How many TRUE are there?
