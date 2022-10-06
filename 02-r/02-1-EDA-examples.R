# Intro to making EDA easier

# Initialize packages
library(ggplot2)
library(DataExplorer)
library(GGally)
# library(tibble)

# Decide on an easy dataset 
PlantGrowth
tibble::glimpse(diamonds)
??glimpse
data("diamonds")

glimpse(starwars)


# Make an EDA report:
create_report(diamonds, 
              output_file = "diamonds_EDA_r2.html", 
              output_dir = "EDA_reports/")

# As an aside:
# Continuous variables, AKA
## Quantitative

# Categorical variables, AKA
## with categories, group, class, label
## Qualitative
## Discrete
## Factors (with Levels)

# Sub-categories of categorical
# Binary, Nominal, Ordinal

# GGally pairs plot
# SPLOM - Scatter plot matrix (x cont, y cont)
g <- ggpairs(diamonds)

# Raster files (png, jpeg, gif, tiff, wmf, bmp) dpi for screen 72, print 300
ggsave(g, filename = "EDA_reports/diamonds_pairs.png", width = 10, height = 10, units = "in")
ggsave(g, filename = "EDA_reports/diamonds_pairs_largeview.png", width = 20, height = 20, units = "in")

# Vector (svg, pdf, .il, eps, ps)

# png("myPlot.png")
# 
# # ploting commands
# 
# dev.off()

