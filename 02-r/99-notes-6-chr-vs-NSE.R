# An example of not using NSE (Non-standard evaluation)
# i.e. using character vectors to access variable names for a dataframe
# inside a function

library("tidyverse")

makePlot <- function(x, y) {

  ggplot(diamonds, aes_string(x, y)) +
  geom_point() +
    labs(title = "main") %>% 
    return()
  
# diamonds[x] %>% 
#   print()

}

ggplot(diamonds, aes(carat, price)) +
  geom_point()
diamonds$price

makePlot(x = "carat", y = "price")
