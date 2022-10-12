# Custom functions - A common source for all scripts

# name functions as verbNoun
makePlot <- function(data = mtcars, x = wt, y = mpg) {
  
  # Check to see if ggplot2 is available 
  stopifnot(require(ggplot2))
  
  # Here using "embracing" to allow for 
  # non-standard evaluation in the function call
  ggplot(data, aes({{x}}, {{y}})) +
    geom_point(
      shape = 16,
      alpha = 0.75,
      color = "#253494")
}
