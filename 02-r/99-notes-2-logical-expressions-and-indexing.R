# Exercises on logical expressions and indexing

# Vectors, Lists, Dataframe
# How many dimensions? (1, 2, n)
# How many elements? What are they?
# Are they named?


# What is it?

# builtin vectors
LETTERS
letters
position_alpha <- 1:26

# Dimensions?
# 1-Dim

# How many elements?
length(LETTERS)

# View it in the env panel is it in Values section
# Print to screen, does it look like a vector?
LETTERS

typeof(LETTERS) # if we get one of the atomic vector types, it's a vector

c("#000000", "#FFFFFF")
my_colors <- c("Black" = "#000000", "White" = "#FFFFFF")
names(my_colors)
my_colors["Black"]
my_colors$Black #not possible

# Thinking about matrics and arrays ----
# NROW(LETTERS) # pretend a vector is a matrix
# NCOL(LETTERS) # pretend a vector is a matrix

# Matrix 2-dim
dim(LETTERS) <- c(2, 13)
LETTERS
dim(LETTERS)
LETTERS <- toupper(letters)

# Array n-dim
dim(LETTERS) <- c(2,1,13)
LETTERS
LETTERS <- toupper(letters)


# 
dim(LETTERS) # 
nrow(LETTERS)
ncol(LETTERS)

# What about a list ----
plant_lm <- lm(weight ~ group, data = PlantGrowth)
plant_anova <- anova(plant_lm)

# Dimensions?
# 1-Dim, each element can be a different type
length(plant_lm) # we get 1 value, the number of elements
typeof(plant_lm) # not an atomic vector type, we get list

# A list's elements can be named
# attributes(plant_lm)
names(plant_lm)

# or not
my_values <- list(1:10, 11:20, 21:30)
my_values

# Names can be used with $
# These first two are vectors, but named vectors
plant_lm$residuals
plant_lm$coefficients

# indexing on lists? [] [[]]
plant_lm["coefficients"]
plant_lm[c("assign", "coefficients")]

# in [] (or [[]])  you can use 3 types of information 
# 5 ways:
# 1a - integers
# 1b - objects, that equates to integers
# 1c - function, that equates to integers

# 2 - chr vector matching the names

# 3 - logical vector

# what are the [[]] in a list?
my_values[1]   # Returns the first element of a list, maintaining the list structure
my_values[[1]] # Returns the first element of a list, extracting if from the list

# Dataframes
# dim?
dim(PlantGrowth) #nrow, ncol
nrow(PlantGrowth)
ncol(PlantGrowth)

class(PlantGrowth) # "data.frame"

# Number of elements
typeof(PlantGrowth) # A list where every element is a vector of the same length
length(PlantGrowth)

# Call elements by name or position
PlantGrowth$weight

PlantGrowth["weight"]

PlantGrowth[,1]
PlantGrowth[1]
# plain vanilla data.frame
PlantGrowth <- as.data.frame(PlantGrowth)
PlantGrowth[,1]
PlantGrowth[1]


# Some exercises 
# What is the highest price for each type of diamond clarity?
# 1 - Somehow we need to isolate each row according to the clarity value
# 2b - Use the max function to find the most expensive
diamonds %>%
  group_by(clarity) %>%
  summarise(max = max(price))

# how about for _only_ clarity is VS2?
# diamonds %>% 
#   group_by(clarity == "VS2") %>% 
#   summarise(max = max(price))

diamonds %>% 
  filter(clarity == "VS2") %>%
  summarise(max = max(price))

max(diamonds$price[diamonds$clarity == "VS2"])
# Which position is it?
# which.max(diamonds$price[diamonds$clarity == "VS2"])

# 2a - Sort the row according to price and choose the max, which is the first row
diamonds %>%
  group_by(clarity) %>%
  arrange(-price) %>% 
  slice(1)

diamonds %>% 
  group_by(clarity) %>% 
  slice_max(order_by = price)

which.max()


# filter() requires logical vector (logical expression: relational and logical operators)
# slice() requires index positions



for (i in ??) {
  # do ... subset according to i
  # get the value
}





# What is the cut & color for the cheapest and most expesive diamond of each clarity?
# If there is a tie in price, return all matches



