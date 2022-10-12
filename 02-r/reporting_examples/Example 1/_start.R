# Example 1 - Compartmentalize parts of your code

# e.g. 1
# Generate objects produced in a script
source("src/0 - data processing.R")

# Data is now available:
spotify_songs

# e.g. 2
# Generate custom functions defined in a different script
source("src/functions.R")

# Functions are now available:
makePlot(mtcars, wt, mpg)