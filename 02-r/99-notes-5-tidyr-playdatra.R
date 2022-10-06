library(tidyverse)

PlayData <- read_tsv("../00-data/PlayData.txt")

PlayData %>% 
  mutate(type = as_factor(type),
         time = as_factor(time)) -> PlayData

# Calculate the ratio of height-to-width
# For each combination of type and time
# A1, A2, B1, B2
# 10/50, 20/60, 30/70, 40/80
PlayData %>% 
  mutate(ratioHW = height/width) %>% 
  select(-height, -width)      # Exclude the columns I don't want

  # select(type, time, ratioHW)  # Include the columns I do want

# PlayData$ratioHW <- PlayData$height/PlayData$width

#######################
# To answer any other question, first make the data tidy:
# Specify the 2 measure variables, but as one argument
# Here, specifying the MEASURE variables TO PIVOT
PlayData %>% 
  pivot_longer(c(height, width))

# Here, specifying the ID variables TO NOT PIVOT
PlayData %>% 
  pivot_longer(-c(type, time)) -> PlayData_t

# pivot_longer(c(height, width), names_to = "dimension", values_to = "output")


# For each combination of type and name (i.e. Height and Width)
# ratio of 1-to-2
# A height 10/20
# A width 50/60
# B height 30/40
# B width 70/80



# These are the groups we need:
table(PlayData_t$type, PlayData_t$name)

# Divide the first value by the second
value[1] / value[2]

# Take the value at time 1 and divide by the value at time 2
value[time == 1] / value[time == 2]

PlayData_t %>% 
  group_by(type, name) %>% 
  summarise(ratioTime = value[time == 1] / value[time == 2])

# if you want to "see" the groups, use
#  group_split() to return a *list of dataframes*
# instead of a single dataframe with a grouping attribute

# How would do that without having tidy data?
# e.g. B width:
PlayData$width[PlayData$type == "B" & PlayData$time == 1] / PlayData$width[PlayData$type == "B" & PlayData$time == 2]

PlayData %>% 
  group_by(type) %>% 
  summarise(ratioWidth = width[time == 1] / width[time == 2],
         ratioHeight = height[time == 1] / height[time == 2])


# For additional work, look at the iris data set:
# You can also look at the Palmer's Penguins data set 
# but it doesn't have the same structural flaws to work with
iris
glimpse(iris)
# 3 species, each with 50 observations
# plot y = length, x = width, color = species, facet = Part (Sepals and Petals)
# Data Vis, we have 3 essential layers
# 1 - Data (in the proper structure)
# 2 - Aesthetic mappings
# 3 - Geometries
