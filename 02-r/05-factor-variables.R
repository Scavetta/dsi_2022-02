# Factor Variables
# Misk Academy Data Science Immersive
# Factor with levels, like categorical variable with groups
# i.e. A small and known number of discrete groups

library(tidyverse)
glimpse(PlantGrowth)
glimpse(diamonds)

# Notice that the levels are printed:
PlantGrowth$weight
PlantGrowth$group

# So what is it actually?
typeof(PlantGrowth$group) # int
class(PlantGrowth$group) # 

# Factor is a special class of type integer
# Where each integer is associated with a label call "level"

# e.g. structure:
str(PlantGrowth)

# To explore the "metadata"
attributes(PlantGrowth$group)
levels(PlantGrowth$group)
as.integer(PlantGrowth$group)

attributes(PlantGrowth)
names(PlantGrowth)
class(PlantGrowth)


# But we treat as a character
PlantGrowth$group == "ctrl"

levels(diamonds$color)
diamonds$color[1:10]

# Advantages:
# Change one spot for everything
levels(PlantGrowth$group)[1] <- "Control"


# Change the order for models:
lm(weight ~ group, data = PlantGrowth)
# y ~ x -> first coefficient 5.032 is the mean of the ctrl
PlantGrowth %>% 
  group_by(group) %>% 
  summarise(avg = mean(weight))

PlantGrowth$group <- factor(PlantGrowth$group, c("trt2", "trt1", "Control"))
lm(weight ~ group, data = PlantGrowth) # different coefficients!!

ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot()
            
            
# ASIDE: Main problem: In pre R 4.0:
# doing math on factors and coercion
test <- c(23:26, "bob")
test

# Old behavior when making a data frame: chr become fct
test_df <- data.frame(test_fct = test, stringsAsFactors = TRUE)
test_df$test_fct
test_df$test_chr <- test
glimpse(test_df)

# But tibbles won't switch types:
test_tb <- tibble(test)
test_tb$test

# Coercion ----
# With a factor of numerical values coercion can be difficult
mean(test_df$test_fct)
mean(test_df$test_chr)

# Solution: 
as.numeric(test_df$test_fct) # no!
# First coerce to character
as.numeric(as.character(test_df$test_fct))

# Change levels easily:
attributes(PlantGrowth)
attributes(PlantGrowth$group)
levels(PlantGrowth$group) <- c("Control", "Fertilizer A", "Fertilizer B")
# View
PlantGrowth
PlantGrowth$group

ggplot(PlantGrowth, aes(group, weight)) +
  geom_boxplot()


# Reorder levels easily: as.factor() #coerce to a factor
PlantGrowth$group <- factor(PlantGrowth$group, levels = c("Fertilizer A", "Fertilizer B", "Control"))

# PlantGrowth %>% 
#   mutate(group = factor(group, levels = c("Fertilizer A", "Fertilizer B", "Control")))

ggplot(PlantGrowth, aes(group, weight)) +
  geom_boxplot()

# View
PlantGrowth
PlantGrowth$group

# There are also ordered factor variables (ordinal variabl equivalent)
glimpse(diamonds)
levels(diamonds$cut)
diamonds$cut
