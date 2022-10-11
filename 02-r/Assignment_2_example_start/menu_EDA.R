library(tidyverse)


menu <- read_csv("data/menu.csv")

# How to get familiar with this dataset quickly?
# look at our data
head(menu, 10)

# Automated EDA
DataExplorer::create_report(menu)
menu %>% 
  select(-Item, -'Serving Size', Calories, Protein, Sodium, Sugars) %>% 
  GGally::ggpairs() -> g
ggsave("splom.png", plot = g, height = 20, width = 20, units = "cm")

# What are the questions we should ask and how to answer them?


glimpse(menu) # look at the structure: the column types, names, a preview of values
# Potential problems: mismatch between type and the actual data. Do we need to sort it out? If so when and how?
# Do I need to change the names: Are there names using illegal chr that can be cleaned up? Are the names consistent?
# What types of analytical questions will I be asking of this data AND does the structure lend itself to how it will be used
# i.e. what actual calculations will you do
# e.g. comparing composition of different categories. What are the categories?
# names(menu)
# names(menu$Category)
table(menu$Category)
unique(menu$Category) # set theory: unique, intersect, union (unique of both), setDiff A->B, setDiff B->A (only found in one group)

# e.g. do calories depend on composition (sugar, prot, carb, sodium)
# These two questions are basically the same! One is 4 major groups compared to a Continuous var and the other is Categorical
# As an entry point, let's make a plot
# This would need tidy format

# ggplot2::ggplot() # ggplot2 is loded as part of the tidyverse
# make a plot of sugar (x) and calories (y)
ggplot(menu, aes(x = Sugars, y = Calories)) +
  geom_point()

# looking for: Any strange or interesting, anything that stands out. How can you explain it?
# A low-level base package version
plot()

# 1 - select() only the columns of interest
# 2 - pivot_longer() to get tidy data
# 3 - ggplot() on the tidy data
# 4 - before plotting (group_by()) or after plotting (facet_grid()) do some kind of grouping
menu %>% 
  janitor::clean_names() %>% 
  select(calories, sugars, protein, sodium, total_fat) %>% 
  pivot_longer(-calories) %>% 
  ggplot(aes(x = value, y = calories)) +
  geom_point() +
  facet_wrap(vars(name), scales = "free")

names(menu)


menu %>% 
  janitor::clean_names() %>% 
  select(category, sugars, protein, sodium, total_fat) %>% 
  pivot_longer(-category) %>% 
  ggplot(aes(x = value, y = category)) +
  geom_point() +
  facet_wrap(vars(name), scales = "free")

library(janitor)
clean_names(menu)
