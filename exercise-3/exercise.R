# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
model_year <- filter(vehicles, year == 2015, make == "Acura")
best_hwy <- filter(model_year, hwy == max(hwy))
best_model <- select(best_hwy, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_acura <- select(
  filter(
    filter(vehicles, year == 2015, make == "Acura"), hwy == max(hwy)
  ), model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_acura_2015 <- filter(vehicles, year == 2015, make == "Acura") %>% 
  filter(hwy == max(hwy)) %>% 
  select(model)

### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
