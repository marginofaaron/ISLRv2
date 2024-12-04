# set seed
set.seed(123)

# create a normal distribution
rnorm(100, mean = 0, sd = 1) -> x

# plot the histogram
hist(x, col = "lightblue", main = "Histogram of a normal distribution", xlab = "Value", ylab = "Frequency")



