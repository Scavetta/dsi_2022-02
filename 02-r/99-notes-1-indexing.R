# Differences in indexing between vectors and lists []
my_vector <- 1:10
my_list <- list(a = 1:10,
                b = 11:21)
# 
my_vector
my_list

my_vector[1]

my_list[[1]] # extracts from list
my_list[[1]][1]

my_list[1] # maintains list structure


mean(1:10)

# How does this calculate the mode for categorical:
my_nominal <- c(rep("Berlin", 4), rep("Riyadh", 7), rep("Paris", 9))

names(sort(-table(my_nominal)))[1] # named vector


# How to get the mode for a continuous variable?
my_continuous <- rnorm(2000, mean = 200, sd = 6)

# mode = peak in a density function
# emperical density function
den_my_continuous <- density(my_continuous)
# plot(den_my_continuous)
position_max_y <- which.max(den_my_continuous$y)
mode_cont <- den_my_continuous$x[position_max_y]



