# example from https://rpubs.com/pjozefek/576206

library(knitr)
library(kableExtra)
library("plot3D")
library(readr)


Advertising <- read_csv("datasets/Advertising.csv")

kable(Advertising[1:6,2:5]) %>%
  kable_styling(
    full_width = FALSE, 
    position = "left", 
    bootstrap_options = "striped")


# set the x, y, and z variables
x <- Advertising$radio
y <- Advertising$TV
z <- Advertising$sales

# Compute the linear regression 
fit <- lm(z ~ x + y)

# create a grid from the x and y values (min to max) and predict values for every point
# this will become the regression plane
grid.lines = 40
x.pred <- seq(min(x), max(x), length.out = grid.lines)
y.pred <- seq(min(y), max(y), length.out = grid.lines)
xy <- expand.grid( x = x.pred, y = y.pred)
z.pred <- matrix(predict(fit, newdata = xy), 
                 nrow = grid.lines, ncol = grid.lines)

# create the fitted points for droplines to the surface
fitpoints <- predict(fit)

# scatter plot with regression plane
scatter3D(x, y, z, pch = 19, cex = 1,colvar = NULL, col="red", 
          theta = 20, phi = 10, bty="b",
          xlab = "Radio", ylab = "TV", zlab = "Sales",  
          surf = list(x = x.pred, y = y.pred, z = z.pred,  
                      facets = TRUE, fit = fitpoints, col=ramp.col (col = c("dodgerblue3","seagreen2"), n = 300, alpha=0.9), border="black"), main = "Advertising")