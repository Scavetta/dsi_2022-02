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

# To answer any other questions, first make the data tidy:
# 
#


# For each combination of type and ("key" / "name", i.e. Height and Width)
# ratio of 1-to-2
# A height 10/20
# A width 50/60
# B height 30/40
# B width 70/80

