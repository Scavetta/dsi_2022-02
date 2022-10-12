# R to HTML ----

# To convert a plain R script to an HTML report:

# Click on the spiral notebook icon in RStudio:
# It's popup label is "Compile Report" and you can find it 
# in the header of this script, or,

# Run this command:
knitr::spin("script.R")
# =========================================================


# R to Rmd to HTML ----

# To convert a plain R script to an HTML report:
knitr::spin("script.R", precious = TRUE)

# =========================================================
