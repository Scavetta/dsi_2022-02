# Using the coffee quality dataset 
# From kaggle

# Run inside 02-r to obtain the data

# mkdir ../04-dataviz/coffee
# cd ../04-dataviz/coffee
# kaggle datasets download -d volpatto/coffee-quality-database-from-cqi
# unzip *.zip

library(tidyverse)
library(ggridges)

coffee <- read_csv("../04-dataviz/coffee/merged_data_cleaned.csv")[-1]

# First, explore the data
glimpse(coffee)
summary(coffee)

# How many countries are there?
# Many. Take only the 12 largest groups:
# Fir
top_countries <- names(sort(table(coffee$Country.of.Origin), decreasing = TRUE)[1:12])

# c("A", "B")c("A", "B")c("A", "B")c("A", "B")c("A", "B")
# c("A", "A", "A", "B", "B", "B", "C", "C", "C") %in% c("A", "B")
# "A""A""A""A""A""A""A""A""A""A"
# 
# 1:10 * c(10, 100)

# Take only the largest groups
coffee %>% 
  select(Country.of.Origin, Total.Cup.Points, altitude_mean_meters) %>% 
  rename("country" = "Country.of.Origin",
         "rating" = "Total.Cup.Points",
         "altitude" = "altitude_mean_meters") %>% 
  filter(country %in% top_countries,
         altitude < 10000, ) -> coffee

# filter implictly removes NAs
# !is.na(altitude)

# Reproduce the plot from class:
coffee %>% 
  arrange(altitude) %>% 
  ggplot(aes(rating, country, color = altitude)) +
  # geom_point() +
  geom_density_ridges() +
  scale_color_viridis_c()


